# Multiple of 3 and 5
#
# Problem
#   Given a positive int, return the sum of all multiples of 3 and 5 up to that number.
#   Input -> Positive Int
#   Output -> Positive Int sum of multiples
# Example
#   3 => 3
#   5 => 8
#   10 => 33
#   1000 => 234168
# Data Structure
#   N/A
# Algorithm
#   Use a range to generate the loop, check if multiple using modulo, and add the
#   multiples to an array, on which to call sum.
# Code
#
def multisum(upto)
  (1..upto).to_a.select { |x| x % 3 == 0 || x % 5 == 0 }.sum
end
