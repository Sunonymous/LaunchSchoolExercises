# get the middle character
#
# Problem     |---------------------------------------------------------------|
#             |Given a non-empty string, return the middle character(s) of the
#             |  string.
#       Input |Non-empty string
#       Output|Middle character, or middle characters if even length.
#       Edges |Empty strings are to be ignored.
#       Rules |If the string has an odd length, only one character is returned.
#             |If the string has an even length, two characters are returned.
#             |The character returned should be in the middle of the string.
#   Questions |
# Example     |---------------------------------------------------------------|
# center_of('I love ruby') == 'e'
# center_of('Launch School') == ' '
# center_of('Launch') == 'un'
# center_of('Launchschool') == 'hs'
# center_of('x') == 'x'
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |Determine if the string has an odd or even length.
#             |If odd, return the character at the index of the floor of len/2.0
#             |If even, return a slice of the string at the same index as odd
#             |  minus one and including an extra character.
# Code________|_______________________________________________________________|
#
def center_of(str)
  odd_length = str.length.odd?
  start_idx = str.length / 2
  odd_length ? str[start_idx] : str[start_idx - 1, 2]
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
