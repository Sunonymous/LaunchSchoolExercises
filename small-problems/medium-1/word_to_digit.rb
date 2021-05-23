# Word to Digit
#
# Problem     |---------------------------------------------------------------|
#             |Given a sentence string as an input, replace any English
#             |  numerical digit with its numerical equivalent, i.e. 'zero -> 0'
#       Input |A sentence string.
#       Output|The same string with replaced digit words.
#       Edges |Empty string.
#             |
#       Rules |A string may contain words describing digits, which must be
#             |  replaced with their numerical equivalents.
#             |The same string must be returned.
#   Questions |
#             |
# Example     |---------------------------------------------------------------|
# word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
# Data        |---------------------------------------------------------------|
#             |An array will hold the digits in both forms and assist the 
#             |  substitution process.
# Algorithm   |---------------------------------------------------------------|
#             |Create two CONSTANT arrays, 'digits' and 'numbers', containing
#             |  0-9 and one through nine, respectively.
#             |Iterate through the numbers array and replace all occurrences
#             |  in the input sentence with the digits at the same index, and
#             |  do so destructively.
#             |Return the input string, now mutated.
# Code________|_______________________________________________________________|
#
DIGITS = %w(0 1 2 3 4 5 6 7 8 9)
NUMBERS = %w(zero one two three four five six seven eight nine)

def word_to_digit(str)
  for number in NUMBERS
    str.gsub!(number, DIGITS[NUMBERS.index(number)])
  end
  str
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
