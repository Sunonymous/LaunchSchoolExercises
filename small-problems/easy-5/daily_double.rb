# Daily Double
#
# Problem     |---------------------------------------------------------------|
#             |Given a string, remove all instances of repeated characters.
#             |
#       Input |String 'str'
#       Output|New String with all consecutively-repeated characters removed.
#       Edges |Empty string
#             |
#       Rules |Each character in the return string must be followed by another,
#             |different character.
#             |Built-in methods #squeeze or #squeeze! may not be used.
#             |
#   Questions |
#             |
# Example     |---------------------------------------------------------------|
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''
# Data        |---------------------------------------------------------------|
#             |No data structures will be used.
# Algorithm   |---------------------------------------------------------------|
#             |Create an empty string to store the results.
#             |Iterate through the given string str by character.
#             |If the current character is different than the last character in
#             | the results string, append it. Otherwise, skip it.
#             |Return the results string.
# Code________|_______________________________________________________________|
#
def crunch(str)
  results = ''
  str.each_char do |char|
    results << char if results.empty?
    results << char if results[-1] != char
  end
  results
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
