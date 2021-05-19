# How Long are You?
#
# Problem     |---------------------------------------------------------------|
#             |Given a string argument, return an array containing every word
#             | in the string followed by a space and the length of the word.
#       Input |A string
#       Output|An array of words with their lengths.
#       Edges |Empty strings.
#       Rules |Words are substrings of any characters separated by a space.
#             |Each element in the returned array should have a word, a space,
#             |  and the number of characters in the word.
#   Questions |
# Example     |---------------------------------------------------------------|
# word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
# word_lengths("baseball hot dogs and apple pie") ==
  # ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
# word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
# word_lengths("Supercalifragilisticexpialidocious") ==
  # ["Supercalifragilisticexpialidocious 34"]
# word_lengths("") == []
# Data        |---------------------------------------------------------------|
#             |Arrays will be constructed and returned.
# Algorithm   |---------------------------------------------------------------|
#             |Split the string by spaces into words.
#             |Iterate over the words array and append the number of characters
#             |  after the individual words.
#             |Return the constructed array.
# Code________|_______________________________________________________________|
#
def word_lengths(str)
  str.split(' ').map do |word|
    "#{word} #{word.length}"
  end
end

puts word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
puts word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
puts word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
puts word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]
puts word_lengths("") == []
