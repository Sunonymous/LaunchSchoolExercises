# loops!!

#1
# break da loop 
=begin
loop do
  puts 'Just keep printing...'
  break
end
=end

#2
# loopception
# loop do
#   puts 'This is the outer loop.'

#   loop do
#     puts 'This is the inner loop.'
#     break
#   end

#   break
# end

# puts 'This is outside all loops.'

=begin
#3 control the loop
iterations = 1

# 5.times do |iterations|
#   puts "Number of iterations = #{iterations+1}"
# end
# okay maybe I cheated with the simplicity of another method

loop do
	puts "Number of iterations = #{iterations}"
	iterations += 1
	break if iterations > 5
end
=end

=begin
# loop on command
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp.downcase
  break if answer == "y" || answer == "yes"
end
=end

=begin
# say hello
say_hello = true
said_count = 0

while say_hello
  puts 'Hello!'
  said_count += 1
  say_hello = false if said_count > 4
end
=end



=begin
# print while
numbers = []
target = 5

while numbers.length < target
  numbers.push rand(100)
end
numbers.each { |n| puts n }
=end


=begin
# count up
count = 10

until count == 0
  count -= 1
  puts 10 - count
end
=end


=begin
# print until
numbers = [7, 9, 13, 25, 18]
printed = 0
until printed == numbers.length
	puts numbers[printed]
	printed += 1
end
=end


# that's odd
# for i in 1..100
#   puts i if i.odd?
# end


# # greet your friends
# friends = ['Sarah', 'John', 'Hannah', 'Dave']
# for friend in friends
# 	puts "Hello, #{friend}!"
# end


########################################################
######## loops 2 #######################################
########################################################

=begin
# even or odd?
count = 1

loop do
	str = (count.odd?)? "The number #{count} is odd." : "The number #{count} is even."
	puts str
  count += 1
  break if count == 6
end
=end


=begin
# catch the number
loop do
  number = rand(100)
  done = (1..10).include?(number)
  break if done
  puts number
end
# I didn't know the Number#between? method. could be useful!
=end


=begin
# conditional loop
process_the_loop = [true, false].sample
if process_the_loop
	loop do
		puts "The loop was processed!"
		break
	end
else
	puts "The loop wasn't processed!"
end
=end


=begin
# get the sum
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
  	puts "That's correct!"
  	break
  end
  puts "Nope! Wrong answer. Try again."
end
=end


=begin
# insert numbers
numbers = []

loop do
	break if numbers.size == 5
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers.push input
end
puts numbers
=end


# # empty the array
# names = ['Sally', 'Joe', 'Lisa', 'Henry']
# loop do
# 	break if names.size <= 0
# 	puts names.pop
# end



# # stop counting
# 5.times do |index|
#   puts index
#   break if index == 2
# end


# # only even
# number = 0

# until number == 10
#   number += 1
#   next if number.odd?
#   puts number
# end



=begin
# first to five
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  if (number_a >= 5) || (number_b >= 5)
  	puts "Five was reached!"
  	break
  else
  	next
  end
end
# noticed that they wrote it more elegantly. an unless line was more concise, because
#   it made the whole if/else branch extraneous
loop do
	number_a += rand(2)
	number_b += rand(2)
	next unless number_a >= 5 || number_b >= 5
	puts "Five was reached!"
	break
end
=end


# greeting
def greeting
  puts 'Hello!'
end

number_of_greetings = 2
greet_count = 0
while greet_count < number_of_greetings
	greeting
	greet_count += 1
end