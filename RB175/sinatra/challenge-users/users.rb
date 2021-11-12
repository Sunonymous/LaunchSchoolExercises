# frozen_string_literal: true

# users.rb

require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

# REQUIREMENTS
# [X] On home page, redirect to users route
# [X] On users route load users and list names
# [X] Each user name should link to user page
# [X]   User page should query match
# [X]   Display interests
# [ ]

helpers do
  def count_interests(data)
    total = 0
    data.each_key { |user| total += data[user][:interests].size }
    total
  end
end

before do
  @users = YAML.load_file('data/users.yaml')
end

not_found do
  [404, {}, ['Whatever you were doing... it didn\'t work!', "\n\n\n", 'Try again!']]
end

get '/' do
  redirect '/users'
  puts 'sup'
end

get '/users' do
  erb(:users)
end

get '/user/:username' do |name|
  name_sym = name.downcase.to_sym
  if @users.keys.include?(name_sym)
    @name = name
    @email = @users[name_sym][:email]
    @interests = @users[name_sym][:interests]
    erb(:user)
  else
    halt(404)
  end
end
