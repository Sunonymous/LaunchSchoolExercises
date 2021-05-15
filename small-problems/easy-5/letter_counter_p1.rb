#  Letter Counter Part One
#
# Problem     |---------------------------------------------------------------|
#             |Given an input string of one or more words, return a hash with
#             |keys of the letter lengths of words, and the values are the
#             |number of words containing that key's number of letters.
#       Input |String 'str' with space-separated words.
#       Output|Hash with word lengths as keys and their respective counts as values.
#       Rules |Words are strings of characters not including spaces.
#             |Return an empty hash for an empty string.
#   Questions |
#             |
# Example     |---------------------------------------------------------------|
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}
# Data        |---------------------------------------------------------------|
#             |Obviously we will be creating a hash to return.
#             |We will also use an array to iterate over the words.
# Algorithm   |---------------------------------------------------------------|
#             |If the string is empty, return an empty hash.
#             |Split the input string by spaces into an array 'words'
#             |Create a hash 'results' with a default value of zero.
#             |Iterate over the words array.
#             |  Each word, add 1 to the key of results matching word length
#             |Return the results hash.
# Code________|_______________________________________________________________|
#

def remove_characters(str)
  words = str.split
  words.each do |word|
    word.gsub!(/[^a-z]/i, '')
  end
  words.join(' ')
end

def word_sizes(str)
  return {} if str.empty?
  str = remove_characters(str) # for part 2 of the exercise!
  words = str.split
  results = Hash.new(0)
  words.each do |word|
    results[word.length] += 1
  end
  results
end

# Part 1 Examples
# puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# puts word_sizes('') == {}
# Part 2 Examples
puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
