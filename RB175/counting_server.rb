# frozen_string_literal: true

require 'socket'

DEBUG = true

def parse_request(request_line)
  http_method, path_and_parameters, version = request_line.split
  path, parameters = path_and_parameters.split('?')
  parameters = (parameters || '').split('&').map do |pair|
    key, value = pair.split('=')
    [key, value]
  end.to_h
  [http_method, path, parameters]
end

server = TCPServer.new('localhost', 3003)

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  method, path, parameters = parse_request(request_line)

  client.puts 'HTTP/1.1 200 OK'
  client.puts 'Content-Type: text/html'
  client.puts
  client.puts '<html>'
  client.puts '<body>'
  if DEBUG
    client.puts "The method is #{method}." if DEBUG
    client.puts "The path is #{path}." if DEBUG
    client.puts "The parameters are #{parameters}." if DEBUG
  end

  number = parameters['number'].to_i
  client.puts '<h1>Counting Page!</h1>'
  client.puts "<p>The current number is... #{number}!</p>"
  client.puts "<a href='?number=#{number + 1}'> + </a>"
  client.puts "<a href='?number=#{number - 1}'> - </a>"

  client.puts '</body>'
  client.puts '</html>'

  client.close
end
