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

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

### ## # ## ###
### DATA
### ## # ## ###

# rubocop:disable Style/ExpandPathArguments
root = File.expand_path('..', __FILE__)
data = "#{root}/data/"
# rubocop:enable Style/ExpandPathArguments

### ## # ## ###
# ROUTES
### ## # ## ###

not_found do
  "whatever it was you were looking for... you won't find it here."
end

before do
  @files = Dir.entries(File.expand_path("#{root}/data/"))
              .select { |file| File.file?(File.join(data, file)) }
end

# root or index page
get '/' do
  erb(:index)
end

# open file
get '/:filename' do |filename|
  unless valid_filename?(filename)
    session[:message] = "The file '#{filename}' does not exist."
    redirect '/'
  end

  filepath = "#{data}#{filename}"

  case filename.split('.').last.downcase
  when 'txt'
    send_file(filepath, type: :text, status: 200)
  when 'md'
    render_markdown(File.read(filepath))
  end
end
