# The End is Near but Not Here
#
# Problem     |---------------------------------------------------------------|
#             |Given a string, return the next to last word in the string.
#       Input |String of words.
#       Output|Second to last word in the string.
#       Edges |Empty string. (Ignored!)
#       Rules |Words are any sequence of non-blank characters.
#             |Must return the word before the final word.
#   Questions |
# Example     |---------------------------------------------------------------|
# penultimate('last word') == 'last'
# penultimate('Launch School is great!') == 'is'
# Data        |---------------------------------------------------------------|
#             |We'll split the string into an array of words.
# Algorithm   |---------------------------------------------------------------|
#             |Split the word by spaces. Return the second to last element.
# Code________|_______________________________________________________________|
#
def penultimate(str)
  str.split[-2]
end

def mid_sentence(str)
  # Since this isn't part of the official exercise, can't tell if I should return
  # the word after or before the midpoint on even-numbered arrays.
  words = str.split
  case words.size
  when 0 then ''
  when 1 then words[0]
  when 2 then words[0]
  else
    mid_idx = (words.size / 2.0).floor
    p mid_idx
    words[mid_idx]
  end
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'
puts mid_sentence("One, two, three")
puts mid_sentence("One, two, three, four")
