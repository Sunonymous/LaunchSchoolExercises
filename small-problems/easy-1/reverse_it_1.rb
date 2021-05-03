# Reverse It P1
#
# Problem
#   Input -> String
#   Output -> String with reversed word order
#   Edge -> Empty string
#   Model: Take a string, split it by spaces, reverse the array, and re-join it with spaces.
# Example
#   reverse_sentence("Hello World") >> "World Hello"
#   reverse_sentence("Reverse these words") >> "words these Reverse"
# Data Structure
#   String -> Array -> String
# Algorithm
#   Split the string by space characters, reverse the array and rejoin it.
# Code
#
def reverse_sentence(str)
  str.split.reverse! * " "
end

