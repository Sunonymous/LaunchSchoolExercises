# Sum of Digits
#
# Problem
#   Input -> Integer
#   Output -> Integer, sum of digits of input
#   Edge -> Negative numbers
#   Model: Take the input to a string and split its chars,
#     then revert them to integers and sum.
# Examples
#   sum(23) == 5
#   sum(496) == 19
#   sum(123_456_789) == 45
# Data Structure
#   Integer -> String -> Array of Chars -> Array of Integers -> Integer
# Algorithm
#   Cast the input to a string. Split the string by characters.
#   Cast the characters back to integers. Reduce and sum.
# Code
#
def sum(num)
  num.to_s.chars.map!(&:to_i).reduce(:+)
end

# Challenge mode
# Oh, I thought of a solution that was already compatible with the challenge... yay!
