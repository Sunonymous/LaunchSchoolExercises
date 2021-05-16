# Capitalize Words
#
# Problem     |---------------------------------------------------------------|
#             |This method takes a string and returns a new string with each
#             |  individual word capitalized and all other letters lowercase.
#       Input |A string
#       Output|The same string with all first letters of words capitalized.
#       Edges |
#       Rules |Words are any sequence of non-blank characters.
#             |Only the first letter is capitalized.
#   Questions |
# Example     |---------------------------------------------------------------|
# word_cap('four score and seven') == 'Four Score And Seven'
# word_cap('the javaScript language') == 'The Javascript Language'
# word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
# Data        |---------------------------------------------------------------|
#             |The string will be split into an array for processing.
# Algorithm   |---------------------------------------------------------------|
#             |Split the input string by spaces into an array.
#             |Iterate over the array and capitalize every first character.
#             |Join the array with spaces and return it.
# Code________|_______________________________________________________________|
#
def word_cap(str)
  words = str.split
  words.each { |word| word.capitalize! }
  words.join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
