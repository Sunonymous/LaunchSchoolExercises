# ASCII String Value
#
# P ------------------------------------------------------------
# Return the ASCII String Value of a given string.
# Requirements:
#   Input -> String
#   Output -> Integer of String Value, defined as the sum of
#             all the ASCII values of the characters in string.
# (Questions)
# 1. What of improper inputs?
#    An improper input could be a blank string, which, because it
#    contains no characters, results in a value of 0.
#    No information is given as to non-string input, so for the purposes
#    of brevity, a simple cast will be performed.
# E ------------------------------------------------------------
# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0
# D ------------------------------------------------------------
# The input string will need to be parsed to an array for iteration.
# A ------------------------------------------------------------
# Input: String 'str'
# Convert str to an array of characters.
# Create a variable to track the sum, 'total'.
# Iterate over the array, adding the character value to total.
# Return total.
# C ------------------------------------------------------------ 
def ascii_value(str)
  characters = str.chars
  total = 0
  characters.each do |char|
    total += char.ord
  end
  total
end

# FE method is Integer#chr. When used on strings with more than one character,
# works only with first character in the string.

def ascii_value_fe(str)
  str.codepoints.sum
end

puts ascii_value_fe('Four score') == 984
puts ascii_value_fe('Launch School') == 1251
puts ascii_value_fe('a') == 97
puts ascii_value_fe('') == 0
