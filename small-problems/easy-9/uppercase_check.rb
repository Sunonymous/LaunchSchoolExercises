# Uppercase Check
#
# Problem     |---------------------------------------------------------------|
#             |Write a method to verify if all the characters in a string are
#             |uppercase.
#       Input |A string
#       Output|true or false based on if all characters are uppercase.
#       Edges |Empty strings should be considered true.
#             |Strings with only symbols? Logically should be true.
#       Rules |Non-alphabetic characters are to be ignored.
#             |Method returns true when all alphabetic characters in string are
#             |  equal to their uppercase equivalent.
#   Questions |
# Example     |---------------------------------------------------------------|
# uppercase?('t') == false
# uppercase?('T') == true
# uppercase?('Four Score') == false
# uppercase?('FOUR SCORE') == true
# uppercase?('4SCORE!') == true
# uppercase?('') == true
# Data        |---------------------------------------------------------------|
#             |Characters will be sorted into an array
# Algorithm   |---------------------------------------------------------------|
#             |Iterate through all the characters in the string and return 
#             |  false if any of the characters are not equivalent to their
#             |  uppercase equivalent.
# Code________|_______________________________________________________________|
#
def uppercase?(str)
  str.chars.all? do |char|
    char == char.upcase
  end
end

# The adventures continue for the over-engineer!
# I think returning true for empty strings is acceptable here because the purpose
# of this method is not to validate input or content, and instead to ensure each
# character is uppercase, which is technically true in the case of an empty string.

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true

