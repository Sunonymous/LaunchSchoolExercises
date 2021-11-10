# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
configure { set :server, :webrick }

get '/' do
  'Getting started.'
end
