# Short Long Short
#
# Problem
#   Receive two strings, determine the longest, return
#     short + long + short
# Example
#   'abc', 'defgh' => 'abcdefghabc'
#   'abcde', 'fgh' => 'fghabcdefgh'
# Data Structure
#   N/A
# Algorithm
#   Use length to determine the longest, and split the
#     into two branches which determine the concatenation
#     order.
# Code
#
def short_long_short(string1, string2)
  first_longer = string1.length > string2.length
  return (string2 + string1 + string2) if first_longer

  (string1 + string2 + string1)
end
