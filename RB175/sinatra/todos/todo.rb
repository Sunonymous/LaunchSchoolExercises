# frozen_string_literal: true

# rubocop:disable Style/HashSyntax
require 'sinatra'
configure { set :server, :webrick }
configure { set :erb, :escape_html => true }
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'tilt/erubis'
# rubocop:enable Style/HashSyntax

# DATA FORMAT
# list: { id: next_id, name: list_name, tasks: [] }
# task: { name: params[:task], completed: false }

# METHODS

# Returns appropriate error message via new_list name validation
#   or nil if validation is successful.
def error_for_list_name(name)
  if !(1..85).cover?(name.size)
    'Lists must have a name between 1 and 85 characters.'
  elsif session[:lists].any? { |list| list[:name] == name }
    'A list with the same name already exists!'
  end
end

# Gets the next valid ID for a Task.
def next_task_id(list)
  (list[:tasks].max_by { |task| task[:id] }[:id] || 0) + 1
end

# Returns appropriate error message via new_task name validation
#   or nil if validation is successful.
def error_for_task_name(name)
  'Tasks must have a name between 1 and 85 characters.' unless (1..85).cover?(name.size)
end

# Returns the next id in the sequence of list ids.
def next_id
  return 0 if session[:lists].empty?

  (session[:lists].max_by { |list| list[:id] })[:id] + 1
end

def valid_id?(id)
  session[:lists].map { |list| list[:id] }.include?(id)
end

def valid_task_id?(list_id, task_id)
  active_list(list_id)[:tasks].any? { |task| task[:id] == task_id }
end

def active_list(id)
  session[:lists].filter { |list| list[:id] == id }.first
end

# CONFIGURATION

helpers do
  def active_list(id)
    @lists.filter { |list| list[:id] == id }.first
  end

  def all_tasks_completed?(task_array)
    !task_array.empty? && task_array.all? { |task| task[:completed] }
  end

  def task_progress(task_array)
    done_count = task_array.filter { |task| task[:completed] }.size
    "#{done_count} / #{task_array.size}"
  end

  def sort_completed_lists(lists)
    lists.sort_by! do |list|
      done = list[:tasks].select { |task| task[:completed] }.size
      undone = list[:tasks].size - done
      undone
    end.reverse
  end

  def sort_completed_tasks(list)
    tasks = list[:tasks]
    tasks.sort_by { |task| task[:completed] ? 1 : 0 }
  end
end

configure do
  enable(:sessions)
  set(:session_secret, 'secret')
end

# ROUTES

before do
  @lists = session[:lists] || []
end

get '/' do
  redirect('/lists')
end

# Viewing master list
get '/lists' do
  erb :lists, layout: :layout
end

# Creates a new list from submitted form
post '/lists' do
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb(:new_list, layout: :layout)
  else # successful!
    session[:lists] << { id: next_id, name: list_name, tasks: [] }
    session[:success] = 'The list was created successfully.'
    redirect('/lists')
  end
end

# Renders form to create new list
get '/lists/new' do
  erb(:new_list, layout: :layout)
end

# Displays individual list page for editing
get '/list/:id' do |id|
  @active_id = id.to_i
  if valid_id?(@active_id)
    erb(:list, layout: :layout)
  else
    session[:error] = 'An invalid list was requested.'
    erb(:lists, layout: :layout)
  end
end

# Posts new task to list
post '/list/:id/tasks' do |id|
  @active_id = id.to_i
  if valid_id?(@active_id)
    error = error_for_task_name(params[:task].strip)
    if error
      session[:error] = error
    else
      id = next_task_id(active_list(@active_id))
      new_task = { name: params[:task], completed: false, id: id }
      (active_list(@active_id))[:tasks].push(new_task)
      session[:success] = 'Tasks added succesfully.'
    end
  else
    session[:error] = 'Cannot add tasks to this list.'
  end
  erb(:list, layout: :layout)
end

# Toggle completion of a particular task in a list
post '/list/:id/complete-task/:task_id' do |list_id, task_id|
  @active_id = list_id.to_i
  task_id = task_id.to_i
  if valid_id?(@active_id)
    if valid_task_id?(@active_id, task_id)
      is_done = params[:completed] == 'true'
      task = active_list(@active_id)[:tasks].select { |tsk| tsk[:id] == task_id }.first
      task[:completed] = is_done
      session[:success] = 'Task status updated successfully.'
    else
      session[:error]   = 'Unable to change completion state of requested task.'
    end
  else
    session[:error] = 'Invalid list requested.'
  end
  redirect("/list/#{@active_id}")
end

# Marks all tasks in a list as complete
post '/list/:id/complete-all' do |id|
  @active_id = id.to_i
  if valid_id?(@active_id)
    active_list(@active_id)[:tasks].each { |task| task[:completed] = true }
    session[:success] = 'All tasks marked as completed.'
  else
    session[:error]   = 'Invalid list requested for operation.'
  end
  erb(:list, layout: :layout)
end

# Delete task from list
post '/list/:id/delete-task/:task_id' do |id, task_id|
  @active_id = id.to_i
  task_id = task_id.to_i
  if valid_id?(@active_id)
    if valid_task_id?(@active_id, task_id)
      active_list(@active_id)[:tasks].delete_if { |task| task[:id] == task_id }
      session[:success] = 'Task removed successfully.'
    else
      session[:error] = 'Unable to delete specified task.'
    end
  else
    session[:error] = 'Invalid list entered.'
  end
  if env['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest'
    # ajax
    status 204
  else
    erb(:list, layout: :layout)
  end
end

# Renders form to rename list via new_list view
get '/list/:id/rename' do |id|
  @active_id = id.to_i
  if valid_id?(@active_id)
    erb(:rename_list, layout: :layout)
  else
    session[:error] = 'An invalid list was requested.'
    erb(:lists, layout: :layout)
  end
end

# Submits a rename request for a particular list.
post '/rename/:id' do |id|
  @active_id = id.to_i
  new_name = params[:list_name].strip
  if valid_id?(@active_id)
    error = error_for_list_name(new_name)
    if error
      session[:error] = error
      erb(:rename_list, layout: :layout)
    else # successful rename
      active_list(@active_id)[:name] = new_name
      session[:success] = 'List renamed successfully.'
      redirect("/list/#{@active_id}")
    end
  else
    session[:error] = 'Cannot retrieve requested list.'
    erb(:list, layout: :layout)
  end
end

# Requests deletion of a particular list.
post '/list/:id/delete' do |id|
  @active_id = id.to_i
  if valid_id?(@active_id)
    session[:lists].delete_if { |list| list[:id] == @active_id }
    if env['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest'
      '/lists'
    else
      session[:success] = 'List deleted successfully.'
      redirect('/lists')
    end
  else
    session[:error] = 'Requested to delete unknown list.'
    erb("/list/#{id}/rename", layout: :layout)
  end
end
