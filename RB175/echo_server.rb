require 'socket'

def parse_query(string)
  return {} if string.nil?
  pairs = string.split('&')
  pairs.map do |pair|
    key, value = pair.split('=')
    [key, value]
  end.to_h
end

DEBUG = false

server = TCPServer.new('localhost', 3003)

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  request_split = request_line.split
  http_method = request_split[0]
  path, parameters = request_split[1].split('?')
  parameters = parse_query(parameters) unless parameters.nil?

  puts request_line

  client.puts request_line
  client.puts "The method is #{http_method}." if DEBUG
  client.puts "The path is #{path}." if DEBUG
  client.puts "The parameters are #{parameters}." if DEBUG
  client.puts "The parsed parameters are #{parameters}." if DEBUG

  number_of_rolls = parameters['rolls'] || '1'
  dice_sides = parameters['sides'] || '6'
  number_of_rolls.to_i.times { client.puts rand(dice_sides.to_i) + 1 }

  client.close
end
