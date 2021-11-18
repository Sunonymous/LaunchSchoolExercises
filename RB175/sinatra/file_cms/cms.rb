# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'
require 'redcarpet'
require 'yaml'
require 'bcrypt'
configure { set :server, :webrick }
enable :sessions
set :session_secret, 'oogly-boogly-four'

### ## # ## ###
# SESSION DATA
### ## # ## ###
# session[:message] contains a string which is displayed at the top of the page
#   as a flash message. it is deleted upon presentation.
# session[:user] contains the string for the active user of the application

### ## # ## ###
# CONSTANTS
### ## # ## ###

VALID_EXTENSIONS = %w[txt md].freeze

### ## # ## ###
# METHODS
### ## # ## ###

# verifies that a filename passed as a url route is valid
def valid_filename?(name_string)
  name, extension = name_string.split('.').map(&:downcase)
  return false if name.nil? || extension.nil?

  return false unless VALID_EXTENSIONS.include?(extension)

  return false unless @files.include?(name_string)

  true
end

# verifies a name passed to it for the purposes of file creation
def error_message_new_file(filename)
  return 'A filename must be included to create a file!' if filename.empty?

  return 'A file with this name already exists!' if @files.include?(filename)

  return 'Unable to create file without extension.' unless filename.include?('.')

  extension = filename.split('.').last.downcase
  return "Unable to create files of filetype '#{extension}'." unless
    VALID_EXTENSIONS.include?(extension)
end

# process which verifies an existing file and redirects home otherwise
def verify_file_exists(filename, error_msg = 'Invalid file requested.')
  return if valid_filename?(filename)

  status 422
  session[:message] = error_msg
  redirect '/'
end

# verifies login credentials to user database
def credential_check(db, username, password)
  db.key?(username) && BCrypt::Password.new(db[username]) == password
end

def verify_user_logged_in
  return unless session[:user].nil?

  session[:message] = 'You must be signed in to do that.'
  redirect('/')
end

### RENDERING
def render_content(filepath, extension)
  case extension
  when 'txt' then render_text(filepath)
  when 'md' then render_markdown(filepath)
  end
end

def render_text(filepath)
  content = File.read(filepath)
  headers['Content-Type'] = 'text/plain'
  content
end

def render_markdown(filepath)
  text = File.read(filepath)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  erb(markdown.render(text))
end

### ## # ## ###
### DATA
### ## # ## ###

# rubocop:disable Style/ExpandPathArguments
# load users database from file
def load_user_database
  test_path = File.expand_path('../test/users.yml', __FILE__)
  work_path = File.expand_path('../users.yml', __FILE__)
  path = ENV['RACK_ENV'] == 'test' ? test_path : work_path
  @users = YAML.load_file(path)
end

# determines path to data to be used, differentiating in test mode
def data_path
  if ENV['RACK_ENV'] == 'test'
    File.expand_path('../test/data', __FILE__)
  else
    File.expand_path('../data', __FILE__)
  end
end
# rubocop:enable Style/ExpandPathArguments

### ## # ## ###
# ROUTES
### ## # ## ###

not_found do
  "whatever it was you were looking for... you won't find it here."
end

before do
  @user = session[:user] if session[:user]
  pattern = File.join(data_path, '*')
  @files  = Dir.glob(pattern).map { |path| File.basename(path) }
end

# root or index page
get '/' do
  erb(:index, layout: :layout)
end

# user sign in page
get '/login' do
  @username = params[:username] || ''
  erb(:login)
end

# user login process
post '/login' do
  load_user_database
  @username = params[:username].downcase
  password = params[:password]
  success = credential_check(@users, @username, password)
  if success
    session[:message] = "Welcome back, #{@username}!"
    session[:user] = @username
    redirect('/')
  else
    status(422)
    session[:message] = 'Invalid credentials.'
    erb(:login)
  end
end

# signs user out
post '/sign-out' do
  session[:user] = nil
  @user = nil
  session[:message] = 'You have been signed out.'
  redirect '/'
end

# create new document
get '/new' do
  verify_user_logged_in
  erb(:new)
end

# add document to files
post '/new' do
  verify_user_logged_in
  @new_filename = params[:filename]
  error_msg = error_message_new_file(@new_filename)
  if error_msg
    status 422
    session[:message] = error_msg
    erb(:new)
  else
    File.open(File.join(data_path, @new_filename), 'w+')
    session[:message] = "File '#{@new_filename}' created successfully."
    redirect('/')
  end
end

# delete file from files
post '/:filename/delete' do |filename|
  file_error = "Unable to delete file #{filename}. Are you sure it exists?"
  verify_file_exists(filename, file_error)
  verify_user_logged_in

  filepath = File.join(data_path, filename)
  File.delete(filepath)
  session[:message] = "File '#{filename}' deleted successfully."
  redirect('/')
end

# open file
get '/:filename' do |filename|
  file_error = "The file '#{filename}' does not exist."
  verify_file_exists(filename, file_error)

  filepath = File.join(data_path, filename)
  extension = filename.split('.').last.downcase
  render_content(filepath, extension)
end

# edit file
get '/:filename/edit' do |filename|
  file_error = "Unable to edit non-existent file #{filename}."
  verify_file_exists(filename, file_error)
  verify_user_logged_in

  filepath = File.join(data_path, filename)
  @file = filename
  @file_content = File.read(filepath)
  erb(:edit_file, layout: :layout)
end

# save edited file
post '/:filename/submit' do |filename|
  file_error = "Unable to save file #{filename}."
  verify_file_exists(filename, file_error)
  verify_user_logged_in

  filepath = File.join(data_path, filename)
  File.open(filepath, 'w+') { |f| f.write(params[:file_content]) }
  session[:message] = "#{filename} has been updated."
  redirect '/'
end
