# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'
require 'redcarpet'
configure { set :server, :webrick }
enable :sessions
set :session_secret, 'oogly-boogly-four'

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

# process which verifies an existing file and redirects home otherwise
def verify_file_exists(filename, error_msg = 'Invalid file requested.')
  return if valid_filename?(filename)

  session[:message] = error_msg
  redirect '/'
end

### RENDERING
def render_content(filepath, extension)
  case extension
  when 'txt' then render_text(filepath)
  when 'md' then render_markdown(filepath)
  end
end

def render_text(filepath)
  File.read(filepath)
end

def render_markdown(filepath)
  text = File.read(filepath)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

### ## # ## ###
### DATA
### ## # ## ###

# rubocop:disable Style/ExpandPathArguments
def data_path
  if ENV['RACK_ENV'] == 'test'
    File.expand_path('../test/data', __FILE__)
  else
    File.expand_path('../data', __FILE__)
  end
end

# root = File.expand_path('..', __FILE__) # Delete later if still unused.
# rubocop:enable Style/ExpandPathArguments

### ## # ## ###
# ROUTES
### ## # ## ###

not_found do
  "whatever it was you were looking for... you won't find it here."
end

before do
  pattern = File.join(data_path, '*')
  @files  = Dir.glob(pattern).map { |path| File.basename(path) }
end

# root or index page
get '/' do
  erb(:index)
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

  filepath = File.join(data_path, filename)
  @file = filename
  @file_content = File.read(filepath)
  erb(:edit_file)
end

# save edited file
post '/:filename/submit' do |filename|
  file_error = "Unable to save file #{filename}."
  verify_file_exists(filename, file_error)

  filepath = File.join(data_path, filename)
  File.open(filepath, 'w+') { |f| f.write(params[:file_content]) }
  session[:message] = "#{filename} has been updated."
  redirect '/'
end
