# Reverse the Digits in a Number
#
# Problem     |---------------------------------------------------------------|
#             |Given a positive integer, return the number with its digits 
#             |reversed.
#       Input |A positive integer.
#       Output|A positive integer with digits in the opposite order.
#       Edges |Leading zeroes in input/output
#       Rules |Digits must appear in the reverse order they were given.
#             |No leading zeroes may appear in the output.
#   Questions |
# Example     |---------------------------------------------------------------|
# reversed_number(12345) == 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21 # No leading zeros in return value!
# reversed_number(12003) == 30021
# reversed_number(1) == 1
# Data        |---------------------------------------------------------------|
#             |An array will be used to temporarily hold the digits.
# Algorithm   |---------------------------------------------------------------|
#             |Create an empty array, results.
#             |Cast the input integer to a string and store its characters in 
#             |  results.
#             |This section needs a bit of revision.
#             |Create an integer to track the start of non-zero characters.
#             |Iterate through the reversed digits and save the first index where
#             |the digit is not zero.
#             |Return the digits starting at the non-0 index, joined and cast 
#             |  again to integer.
# Code________|_______________________________________________________________|
#
def reversed_number(num)
  digits = num.to_s.reverse.chars
  non_zero_start = 0
  idx = 0
  non_zero_start = loop do
    break idx if digits[idx] != '0'
    idx += 1
  end
  digits[non_zero_start..-1].join.to_i
end
# Huh. I didn't expect to_i to ignore leading zeroes in the string.
# Oh well.

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1
