# Next Featured Number Higher than a Given Value
#
# Problem     |---------------------------------------------------------------|
#             |Given an integer, return the next featured number greater than
#             |the integer given.
#       Input |An integer.
#       Output|An integer, the next featured number.
#       Edges |Negative numbers. The last featured number.
#       Rules |Featured numbers are odd numbers, divisible by 7, with each digit
#             |  unique.
#   Questions |
# Example     |---------------------------------------------------------------|
# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987
#
# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |If number given is greater than 999999987, return nil
#             |Create a new variable, result.
#             |Until the result meets the conditions, continue to add 1 to it.
#             |Return result.
# Code________|_______________________________________________________________|
#
def featured(num)
  return nil if num > 999999987
  result = num + 1
  until result.odd? &&
        result % 7 == 0 &&
        result.to_s.chars.uniq.size == result.to_s.chars.size
    result += 1
  end
  result
end

def is_featured?(num)
  num.odd? && num % 7 == 0 &&
    num.to_s.chars.uniq.size == num.to_s.size
end

def featured(num)
  num += 1
  num += 1 until num.odd? && num % 7 == 0
  until num >= 9876543210
    puts "I got #{num}" if is_featured?(num)
    return num if is_featured?(num)
    num += 14
  end
  return 'No number meets your criteria.'
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
puts featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
