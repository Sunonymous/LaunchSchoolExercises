# Double Char (Part 1)
#
# Problem     |---------------------------------------------------------------|
#             |Given a string, return a new string with every character doubled.
#       Input |A string
#       Output|A new string with doubled characters.
#       Edges |Empty string
#       Rules |Each character given must appear twice in the same sequence given.
#   Questions |
# Example     |---------------------------------------------------------------|
# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd  jjoobb!!"
# repeater('') == ''
# Data        |---------------------------------------------------------------|
#             |An array will host and iterate through the characters.
# Algorithm   |---------------------------------------------------------------|
#             |Create an empty array, results.
#             |Iterate through the characters in input string.
#             |For each character, append it twice to the results array.
#             |Return results joined together.
# Code________|_______________________________________________________________|
#
def repeater(str)
  results = []
  str.each_char { |char| results << char * 2 }
  results.join('')
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''

# Double Char (Part 2)
#
# Problem     |---------------------------------------------------------------|
#             |Given a string, return a new string where every consonant is
#             |doubled. Everything else remains the same.
#       Input |String
#       Output|New string with doubled consonants.
#       Edges |Empty string.
#       Rules |Only the consonants in the input string are doubled.
#   Questions |
# Example     |---------------------------------------------------------------|
# double_consonants('String') == "SSttrrinngg"
# double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# double_consonants("July 4th") == "JJullyy 4tthh"
# double_consonants('') == ""
# Data        |---------------------------------------------------------------|
#             |Arrays will be used to store the results.
# Algorithm   |---------------------------------------------------------------|
#             |Create a constant containing all the consonants to check for.
#             |Create an empty array, results.
#             |Iterate through the characters in input string.
#             |If the lowercase version of the character is in the consonants
#             |  array, append it twice to results.
#             |Otherwise, append the character only once.
#             |Return the joined version of results.
# Code________|_______________________________________________________________|
#
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)
def double_consonants(str)
  results = []
  str.each_char do |char|
    is_consonant = CONSONANTS.include?(char.downcase)
    results << char
    results << char * 2 if is_consonant
  end
  results.join
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
