# Reverse It P2
#
# Problem
#   Input -> String
#   Output -> Same string with each word containing 5+ characters reversed.
#   Model -> Iterate through the words in a string, reversing those which 
#   are longer than five characters.
# Example
#   puts reverse_words("walk around the block") >> "walk dnuora the kcolb"
#   puts reverse_words("launch school") >> "hcnual loohcs"
# Data Structure
#   The string is split into an array, modified, and rejoined into a string.
# Algorithm
#   Split the string by spaces, iterate through it and reverse each word
#   longer than 4 characters. Rejoin the string.
# Code
#
class String
  def reverse_if_long
    reverse! if length > 4
    self
  end
end

def reverse_words(str)
  arr = str.split
  arr.map!(&:reverse_if_long)
  # Below was my original method, but I played around with a challenge suggested by another student.
  # arr.each do |word|
    # word.reverse! if word.length > 4
  # end
  arr * " "
end

