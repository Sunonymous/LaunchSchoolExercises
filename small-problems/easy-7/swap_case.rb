# Swap Case
#
# Problem     |---------------------------------------------------------------|
#             |Taking an input string, return a new string with the case of all
#             |the characters switched, e.g. A => a, H => h, etc.
#       Input |String
#       Output|String with characters case-swapped
#       Edges |Symbols
#       Rules |Each uppercase letter should become lowercase and vice versa.
#             |Any non-alphabetic character should not be changed.
#   Questions |
#             |
# Example     |---------------------------------------------------------------|
# swapcase('CamelCase') == 'cAMELcASE'
# swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |Create a new string, 'results'.
#             |Iterate through the characters in the input string.
#             |If the character is uppercase, append its lowercase equivalent to results.
#             |If the character is lowercase, append its uppercase equivalent to results.
#             |If the character is anything else, leave it the same and appent to results.
#             |Return the new string.
# Code________|_______________________________________________________________|
#
UPPERCASE_LETTERS = ('A'..'Z')
LOWERCASE_LETTERS = ('a'..'z')
def swapcase(str)
  results = ""
  str.each_char do |char|
    if UPPERCASE_LETTERS.include?(char)
      results << char.downcase
    elsif LOWERCASE_LETTERS.include?(char)
      results << char.upcase
    else
      results << char
    end
  end
  results
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
