# Letter Swap
#
# Problem     |---------------------------------------------------------------|
#             |Given a string of words, return a string with the first and last
#             |letters of every word are swapped.
#       Input |Single string of words.
#       Output|New string with swapped first and last letters per word.
#       Rules |Every word has at least one letter.
#             |Words are groups of characters separated by spaces.
#             |Every string will contain at least one word.
#             |Each string has nothing but words and spaces.
#       Edges |Single-letter words must be handled separately.
#   Questions |
# Example     |---------------------------------------------------------------|
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'
# Data        |---------------------------------------------------------------|
#             |An array will be used to store the individual words.
# Algorithm   |---------------------------------------------------------------|
#             |Input of 'str'
#             |Split str by spaces into an array of words.
#             |Iterate through the words, passing single letter words, and
#             |saving the first and last letters of longer words.
#             |Replace the first letter with the last and vice versa on words
#             |longer than a single character.
#             |Join the array with spaces again, and return it.
# Code________|_______________________________________________________________|
#
def swap(str)
  words = str.split
  words.each do |word|
    next if word.length < 2
    first_letter = word[0]
    last_letter = word[-1]
    word[0] = last_letter
    word[-1] = first_letter
  end
  words.join(" ")
end

def experimental_swap(str)
  words = str.split
  words.each do |word|
    next if word.length < 2
    word[0], word[-1] = swap_first_last_characters(word[0], word[-1])
  end
  words.join(' ')
end

def swap_first_last_characters(a, b)
  a, b = b, a
end

# puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# puts swap('Abcde') == 'ebcdA'
# puts swap('a') == 'a'
puts experimental_swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts experimental_swap('Abcde') == 'ebcdA'
puts experimental_swap('a') == 'a'
