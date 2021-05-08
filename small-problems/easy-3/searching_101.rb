# Searching 101
#
# Problem
#   Get 6 numbers from the user, and display whether or not
#     the sixth number was one of the other five numbers.
#   Input: Six Numbers
#   Output: String Confirmation
#   Edge: Invalid numeric input.
#   Model: Create a list of give numbers, get six from the
#     user and display if the sixth was within the first five.
# Example
#   [0,1,2,3,4,5], 4 => true
#   [0,1,2,3,4,5], 6 => false
# Data Structure
#   Array to hold numbers given.
# Algorithm
#   Validate and store six user-provided numbers into an array.
#   Confirm and display if there are two or more of the sixth number.
# Code
#
def prompt(message)
  puts ("~~| #{message} |~~")
end

def grab_number
  prompt("Please provide me a number.")
  prompt("Anything invalid I will consider 0.")
  print('>>  ')
  num = gets.chomp.to_i
  puts
  num
end

prompt("************************")
prompt("Welcome to Searching 101")
prompt("************************")
numbers = []
while numbers.size < 6
  numbers.push(grab_number)
end
sixth_entry_twice = (numbers.count(numbers[5]) != 1)

straggler = numbers[5]
numbers.delete_at(5)
negative = sixth_entry_twice ? "" : "not "
prompt("The number #{straggler} is #{negative}within the numbers #{p numbers}.")

