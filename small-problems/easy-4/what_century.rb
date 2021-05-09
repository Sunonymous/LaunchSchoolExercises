# What Century is That?
#
# Problem
#   Receives integer year, returns the corresponding century.
#   Edge Case Discovered along the way - 11, 12, 13.. 19 all
#     end in 'th'
# Example
#   2000 => '20th'
#   2001 => '21st'
#   1965 => '20th'
#   256 => '3rd'
# Data Structure
#   Array to hold string endings for numbered words.
# Algorithm
#   Use divmod to get how many 100s have passed and the remainder
#   pass the last digit into an array to get the word ending
# Code
#
def century(year)
  hundreds, remainder = year.divmod(100)
  hundreds += 1 if remainder.positive?
  word_endings = %w(th st nd rd th)
  last_digit = hundreds.to_s[-1].to_i
  last_digit = 4 if last_digit > 4
  # edge case for the terrible teen years
  return hundreds.to_s + 'th' if hundreds > 9 &&
                                 hundreds.to_s[-2] == '1'

  hundreds.to_s + word_endings[last_digit]
end
