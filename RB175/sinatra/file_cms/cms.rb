# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'
configure { set :server, :webrick }

root = File.expand_path(__dir__)

get '/' do
  @files = Dir.entries(File.expand_path("#{root}/data/"))
              .select { |file| File.file?(File.join('./data/', file)) }
  erb(:index)
end
