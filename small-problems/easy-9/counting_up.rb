# Counting Up
#
# Problem     |---------------------------------------------------------------|
#             |Given an integer argument, return an array of all the numbers
#             |from 1 to the argument, sequentially.
#       Input |A positive integer.
#       Output|An array of integers from 1 to n.
#       Edges |Prompt says to ignore input validation.
#       Rules |Input will be a positive integer greater than zero.
#             |Output must be an array of sequential integers from 1 to n.
#   Questions |
# Example     |---------------------------------------------------------------|
# sequence(5) == [1, 2, 3, 4, 5]
# sequence(3) == [1, 2, 3]
# sequence(1) == [1]
# Data        |---------------------------------------------------------------|
#             |Array will be constructed and returned.
# Algorithm   |---------------------------------------------------------------|
#             |Create an empty array.
#             |Create a range from 1 to n.
#             |Iterate using the range and appending the numbers to the array.
#             |Return the array.
#             |BONUS: I'd like to see if I can do this in a single line.
# Code________|_______________________________________________________________|
#
def sequence(num)
  results = []
  (1..num).each { |n| results << n }
  results
end

def sequence(num)
  1.upto(num).each_with_object([]) { |n, arr| arr << n }
end

# Ha! theirs was even simpler than my one line. Hadn't thought of that...

def sequence(num)
  return [] if num == 0
  target = num < 0 ? -1 : num
  start  = num < 1 ? num : 1
  (start..target).to_a
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
puts sequence(-1) == [-1]
puts sequence(-5) == [-5, -4, -3, -2, -1]
