# Delete Vowels
#
# Problem     |---------------------------------------------------------------|
#             |Write a method taking an array of strings, returning a new array
#             |of the same strings with all their vowels removed.
#       Input |Array 'str_array' of strings.
#       Output|Array 'results' of strings without vowels.
#       Edges |Empty array.
#       Rules |Strings within the return array may NOT contain A, E, I, O, or U
#             |Y is not considered a vowel (was it ever?).
#   Questions |Are empty strings included within the return array? >> Yes
#             |
# Example     |---------------------------------------------------------------|
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
# Data        |---------------------------------------------------------------|
#             |Arrays are used to process and hold the data.
# Algorithm   |---------------------------------------------------------------|
#             |Create an empty array to store the 'results'
#             |Iterate through each string in str_array.
#             |Assign the string to a new string through the gsub method to
#             |  remove the characters a, e, i, o, and u.
#             |Append this new string to the results array.
#             |Return the results array.
# Code________|_______________________________________________________________|
#
VOWELS = %w(A a E e I i O o U u)
def remove_vowels(str_array)
  results = []
  str_array.each do |string|
    new_string = string.clone
    VOWELS.each { |vowel| new_string.gsub!(vowel, '') }
    results << new_string
  end
  results
end

def remove_vowels(str_array)
  # I forget that some of those methods work by character and not phrase
  str_array.map { |str| str.delete('AaEeIiOoUu') }
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
