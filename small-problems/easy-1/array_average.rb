# Array Average
#
# Problem
#   Input -> Array of Integers
#   Output -> Integer Average
#   Edge -> Empty Array (ignore), Negative Integers (ignore)
#   Model: Sum the integers in the array and divide them by the count.
# Example
#   average([1, 6]) == 3
#   average([1, 5, 87, 45, 8, 8]) == 25
# Data Structure
#   Array (i) -> Integer
# Algorithm
#   Save the length of the array into a variable, add all the integers
#   and divide by the length.
# Code
#
def average(arr)
  len = arr.size
  # len = len.to_f
  arr.sum / len
end
