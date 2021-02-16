# # repeat after me
# puts "Please. Tell me something, anything!"
# anything = gets.chomp
# puts anything

# # age in months
# puts "What is your age in years?"
# years = gets.chomp.to_i
# puts "That would mean... you're (at least) #{years*12} months old! Wow!"


# # print something part 1
# puts "May I say something to you? (y / n)"
# answer = gets.chomp.downcase
# puts "something" if answer == 'y'


=begin
# # part 2
# puts "May I say something to you? (y / n)"
# loop do
# 	answer = gets.chomp.downcase
# 	if answer == 'y'
# 		puts "something"
# 		break
# 	elsif answer == 'n'
# 		puts "Oh, alright."
# 		break
# 	else
# 		puts "I'm sorry; I wasn't able to understand what you want."
# 		puts "Please tell me y or n ! May I say something?"
# 	end
# end
# their solution was more elegant, so I'm transcribing it even though I understand it
choice = nil # instantiated here to use outside of the loop
loop do
	puts "May I say something to you? (y/n)"
	choice = gets.chomp.downcase
	break if %w(y n).include?(choice)
	puts "Please tell me either y or n !"
end
puts 'something' if choice == 'y'
# I've used the pattern of having acceptable responses in an array before (with other languages).
# This simplifies the if/else branch, since n as a response doesn't do anything
=end


# # launch school printer
# times = nil
# loop do
# 	puts "How many times can I say it?"
# 	times = gets.chomp.to_i
# 	break if times >= 3
# 	puts "Something's not quite right with that. How about at least three?"
# end
# times.times { puts "Launch School is the best! They said so!"}


# # password
# PASSWORD = "sunshine"
# loop do
# 	puts "Secure zone: please enter your password."
# 	pass_try = gets.chomp
# 	break if pass_try == PASSWORD
# 	puts "Incorrect password. Please try again, or feel free to leave."
# end
# puts "Access granted. Have a greatish day!"

=begin
# username and password
user = nil
user_db = {"sunny" => "sunshine", "anahata" => "love"}
loop do
	puts "High-Security Zone: Enter username."
	user = gets.chomp
	puts "Enter user #{user}'s password."
	pass = gets.chomp
	fail_flag = (user_db.include?(user) && user_db[user] == pass)? false:true
	break unless fail_flag
	puts "Incorrect credentials. Please try again, or feel free to leave.\n~ ~ ~\n"
end
puts "User #{user} logged in successfully. Welcome!\n~Keep your password safe and your veggies fresh!~"
=end


=begin
# dividing numbers
def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

to_get = %w(dividend divisor)
division_set = []

loop do
	break if division_set.size == 2
	idx = division_set.size
	puts "Please provide me the #{to_get[idx]}."
	response = gets.chomp
	division_set.push response.to_i if valid_number?(response) && response.to_i > 0
	puts "You may only supply integers greater than zero! Try again." if idx == division_set.size
end
result = division_set[0] / division_set[1]
puts "Thank you. #{division_set[0]}/#{division_set[1]} = #{result}"
=end


=begin
# launch school printer part 2
times = nil
again = false
quit_responses = %w(q quit)
loop do
	addition = (again)? " more":""
	puts "How many#{addition} times can I say it?"
	response = gets.chomp
	break if quit_responses.include?(response.downcase)
	if response.to_i < 3
		puts "Something's not quite right with that. How about at least three?"
	else
		response.to_i.times { puts "Launch School is the best! They said so!"}
		again = true
		puts
	end
end
=end


# opposites attract
def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

# Okay, so based on the constraints they wanted, I went a little overboard with functionality.
# I'm rewriting it more in the manner that they wanted, a method loop to get the numbers.

def has_p_n?(array)
	pos = false
	neg = false
	array.each do |x|
		pos = true if x.positive?
		neg = true if x.negative?
	end
	(pos && neg)
end

number1 = nil
number2 = nil

def get_number
	num = nil
	loop do
		puts "Please give me a positive or negative number."
		num = gets.chomp
		break if valid_number?(num) && num.to_i != 0
		puts "This is not a valid number... zero is not allowed!"
	end
	num.to_i
end

loop do
	number1 = get_number
	number2 = get_number
	# check for pos and neg
	arr = [number1, number2]
	restart_flag = !(has_p_n?(arr)) # invert based on test condition
	puts "You have not given me one positive and one negative number. Let's start again.\n~~~" if restart_flag
	next if restart_flag
	result = number1 + number2
	puts "Great. #{number1} + #{number2} = #{result}"
	break
end

=begin MY ORIGINAL ATTEMPT
def need_pos?(array)
	(array[0] < 0)? true : false
end

def has_p_n?(array)
	pos = false
	neg = false
	array.each do |x|
		pos = true if x.positive?
		neg = true if x.negative?
	end
	(pos && neg)
end

numbers = []
puts "Let's add two numbers."
loop do
	# checks
	restart_flag = !has_p_n?(numbers) if numbers.size == 2
	puts "You should have given me one positive and one negative number. Let's begin again." if restart_flag
	numbers.clear if restart_flag
	# grabbin nums
	start_size = numbers.size
	break if start_size == 2
	both = numbers.empty?
	str = need_pos?(numbers) ? "a positive number" : "a negative number" if !both
	str = "a positive or a negative integer" if both
	puts "Please provide me #{str}."
	response = gets.chomp
	numbers.push(response.to_i) if valid_number?(response) && response.to_i != 0
	next if numbers.size > start_size
	puts "You have given me an invalid number."
end
result = numbers[0] + numbers[1]
puts "Thank you. #{numbers[0]} + #{numbers[1]} = #{result}"
=end