# Staggered Caps Part One
#
# Problem     |---------------------------------------------------------------|
#             |With a string input, return a new string with character-case
#             |staggered, i.e. alternating between upper and lower case.
#       Input |String
#       Output|New String with Staggered Case
#       Edges |Symbols or non-alphabet characters
#       Rules |Case should be alternating between each letter.
#             |Non-alphabet characters should not be changed, but still count
#             |  as characters when tracking the staggering.
#   Questions |Which case should begin? Examples suggest that UPPER starts it.
#             |
# Example     |---------------------------------------------------------------|
# staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# staggered_case('ALL_CAPS') == 'AlL_CaPs'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |Create a new string, results.
#             |Iterate through the characters in the input string with their index.
#             |If the index is 0 or even, append the uppercase version of the 
#             |  character to the results string.
#             |Otherwise, append the lowercase version to results.
#             |Return results.
# Code________|_______________________________________________________________|
#
def staggered_case(str)
  results = ""
  str.chars.each_with_index do |char, idx|
    results << char.upcase if idx.even?
    results << char.downcase if idx.odd?
  end
  results
end

def staggered_case(str, lower_first: false)
  results = ""
  str.chars.each_with_index do |char, idx|
    if lower_first
      results << char.upcase if idx.even?
      results << char.downcase if idx.odd?
    else
      results << char.upcase if idx.even?
      results << char.downcase if idx.odd?
    end
  end
  results
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
