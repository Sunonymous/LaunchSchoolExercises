# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'
configure { set :server, :webrick }

get '/' do
  @files = Dir.entries('./data/')
              .select { |file| File.file?(File.join('./data/', file)) }
  erb(:index)
end
