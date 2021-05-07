# Sum of Product of Consecutive Integers
#
# Problem
#   Get an integer from the user, greater than 0.
#   Ask if the user wants the sum or product of all
#     integers between 1 and the given integer.
#   Display the result.
# Example
#   5, s => 15
#   6, p => 720
# Data Structure
#   N/A
# Algorithm
#   Get the appropriate inputs, then perform the calculation.
# Code
#
def grab_num
  print "Please give me a positive number.\n>> "
  loop do
    num = gets.to_i
    return num unless num <= 0

    print "Please enter a number 1 or greater.\n>> "
  end
end

def get_choice(options)
  loop do
    choice = gets.chomp
    return choice if options.include?(choice)

    print "Please enter a valid choice!\n>> "
  end
end

num = grab_num
puts '- Please choose from the following options:'
puts "-- s -> Calculate the sum of numbers from 1 to #{num}"
print "-- p -> Calculate the product of numbers from 1 to #{num}\n>> "
response = get_choice(%w(s p))
case response
when 's'
  puts 'Calculating the sum of the numbers specified.'
  answer = (1..num).to_a.sum
when 'p'
  puts 'Calculating the product of the numbers specified.'
  answer = (1..num).to_a.reduce(:*)
end
puts "The result is #{answer}."
