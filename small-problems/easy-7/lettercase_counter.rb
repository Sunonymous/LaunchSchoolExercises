# Lettercase Counter
#
# Problem     |---------------------------------------------------------------|
#             |Create a method which takes a string and returns a hash detailing
#             |  the number of uppercase, lowercase, and neither characters.
#       Input |A string
#       Output|A hash with three keys, :uppercase, :lowercase, and :neither,
#             |  all with the number of characters within their category.
#       Edges |Empty string.
#       Rules |
#             |
#   Questions |
# Example     |---------------------------------------------------------------|
# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
# Data        |---------------------------------------------------------------|
#             |Using a hash to store the character counts.
# Algorithm   |---------------------------------------------------------------|
#             |Create an empty hash 'results' with a default value of 0.
#             |Iterate through the characters in the string.
#             |  If character is lowercase letter, add 1 to :lowercase
#             |  If character is uppercase letter, add 1 to :uppercase
#             |  Else, add 1 to :neither
#             |Return results
# Code________|_______________________________________________________________|
#
def letter_case_count(str)
  results = Hash.new(0)
  [:uppercase, :lowercase, :neither].each { |sym| results[sym] = 0 }
  return results if str.length == 0
  str.each_char do |char|
    if ('A'..'Z').include?(char)
      results[:uppercase] += 1
    elsif ('a'..'z').include?(char)
      results[:lowercase] += 1
    else
      results[:neither] += 1
    end
  end
  results
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
