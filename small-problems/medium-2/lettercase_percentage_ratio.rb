# Lettercase Percentage Ratio
#
# Problem     |---------------------------------------------------------------|
#             |Given a string, return a hash with three keys, lowercase, upper-
#             |case and neither, with the values of each being the percentage
#             |of characters in that category within the original string.
#       Input |A string of at least one character.
#       Output|The hash containing the ratio of characters by case.
#       Edges |Empty string (ignore)
#       Rules |Each percentage is expressed as a floating number.
#             |Characters that are non-alphabetic are sorted into the neither key.
#   Questions |
# Example     |---------------------------------------------------------------|
# letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
# letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
# Data        |---------------------------------------------------------------|
#             |Returning a hash!
# Algorithm   |---------------------------------------------------------------|
#             |Create a new hash with the appropriate keys initialized at 0.
#             |Iterate through the string by character, incrementing the 
#             |  appropriate keys by one if the character matches.
#             |Create a total variable by adding up the count of all three vals.
#             |Set each value to the quotient of dividing the value by the 
#             |  total multiplied by 100.
#             |Return the hash.
# Code________|_______________________________________________________________|
#
def letter_percentages(str)
  results = { lowercase: 0, uppercase: 0, neither: 0 }
  str.each_char do |char|
    case char
    when ('A'..'Z') then results[:uppercase] += 1
    when ('a'..'z') then results[:lowercase] += 1
    else results[:neither] += 1
    end
  end
  total = results.values.sum.to_f
  results.each { |key, val| results[key] = ((val / total) * 100).round(2) }
  results
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
puts letter_percentages('abcdefGHI') == {:lowercase=>66.67, :uppercase=>33.33, :neither=>0.0}
