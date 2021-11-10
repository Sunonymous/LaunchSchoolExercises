# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'
configure { set :server, :webrick }

# CONSTANTS
VALID_EXTENSIONS = %w[txt].freeze

# METHODS

# verifies that a filename passed as a url route is valid
def valid_filename?(name_string)
  name, extension = name_string.split('.')
  return false if name.nil? || extension.nil?

  return false unless VALID_EXTENSIONS.include?(extension)

  return false unless @files.include?(name_string)

  true
end

# DATA

# rubocop:disable Style/ExpandPathArguments
root = File.expand_path('..', __FILE__)
data = "#{root}/data/"
# rubocop:enable Style/ExpandPathArguments

# ROUTES

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
  return 404 unless valid_filename?(filename)

  send_file("#{data}#{filename}", type: :text, status: 200)
end
