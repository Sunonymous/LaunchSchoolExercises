# List of Digits
#
# Problem
#   Input -> Number
#   Output -> Array of digits in Number
#   Edges -> Negative number
#   Model -> Convert number to string and build an array from each of its digits.
# Example
#   digit_list(12345) >> [1, 2, 3, 4, 5]
#   digit_list(7) >> [7]
# Data Structure
#   Integer -> String -> Array
# Algorithm
#   Cast the number into a string and use the chars method to build it into an array.
# Code
#
def digit_list(num)
  String(num).chars.map! {|d| d.to_i }
end

