# Staggered Caps Part Two
#
# Problem     |---------------------------------------------------------------|
#             |Given a string, return a new string with alternating character
#             |case, and ignoring non-alphabetic characters.
#       Input |String
#       Output|New String with alternating case
#       Edges |
#             |
#       Rules |Each alphabetic character should be the opposite case from the
#             |  character preceding it.
#             |Symbols are included, but do not count towards changing case.
#   Questions |Which case to start with? Examples Suggest UPPERCASE.
# Example     |---------------------------------------------------------------|
# staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# staggered_case('ALL CAPS') == 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
# Data        |---------------------------------------------------------------|
#             |May use an array to work through the characters.
# Algorithm   |---------------------------------------------------------------|
#             |Initialize a constant containing all alphabetic characters.
#             |Create a new string, results.
#             |Create a boolean, case_upper.
#             |Iterate through the characters.
#             |If the character is in the alphabet, reference the boolean to 
#             |  determine whether or not to append its uppercase or lowercase
#             |  version to results. Toggle the boolean after doing so.
#             |If the character is not in the alphabet append it to results.
#             |Return results.
# Code________|_______________________________________________________________|
#
ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a
def staggered_case(str, symbols_count: false)
  results = ""
  upper_case = true
  str.each_char do |char|
    if ALPHABET.include?(char)
      letter = upper_case ? char.upcase : char.downcase
      results << letter
      upper_case = !upper_case
    else
      results << char
      upper_case = !upper_case if symbols_count
    end
  end
  results
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
