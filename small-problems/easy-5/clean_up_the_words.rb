# Clean Up the Words
#
# Problem     |---------------------------------------------------------------|
#             |Given a string of all lowercase words and symbols, remove all
#             |symbols and return a new string with all non-alphabetic charac-
#             |ters replaced by a single string.
#       Input |String of lowercase words with symbols.
#       Output|New String with symbols replaced with a space.
#       Rules |No consecutive spaces are allowed in the returned string.
#             |Case does not need to be changed.
#             |
#             |
#   Questions |
#             |
#             |
#             |
# Example     |---------------------------------------------------------------|
# cleanup("---what's my +*& line?") == ' what s my line '
# Data        |---------------------------------------------------------------|
#             |Input string will be split into an array to process.
# Algorithm   |---------------------------------------------------------------|
#             |Create an array called 'results' to hold the final product.
#             |Iterate over the input string.
#             |  If character is a symbol and the last element in results is a
#                  space, go to the next iteration.
#                If character is a symbol and the last element is not a space,
#                  add a space.
#                If the character is not a symbol, add it to results.
#             |Return the results array.
# Code________|_______________________________________________________________|
#
LETTERS = ('a'..'z').to_a

def cleanup(str)
  results = []
  str.each_char do |char|
    if LETTERS.include?(char)
      results << char
    elsif !LETTERS.include?(char) && results[-1] != ' '
      results << ' '
    end
  end
  results.join('')
end

puts cleanup("---what's my +*& line?") == ' what s my line '
