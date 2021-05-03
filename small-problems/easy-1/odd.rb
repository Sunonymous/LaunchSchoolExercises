# Odd
#
# Problem
#   Input -> Integer
#   Output -> Boolean
#   Determine whether integer is odd and return true if so, false if not.
#   Model: use modulo with 2 to determine if the number is evenly divisible by two.
#   Edge: 0, which I originally thought was an edge... err, is apparently not.
# Example
#   puts is_odd?(5) >> true
#   puts is_odd?(4) >> false
# Data Structure
#   N/A
# Algorithm
#   Use a ternary operator to return true or false based on using
#   the modulo operator to determine whether or not the number is divisible by 2. 
# Code
#
def is_odd?(int)
  return (int % 2 == 0)
end

