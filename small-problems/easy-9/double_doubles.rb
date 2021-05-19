# Double Doubles
#
# Problem     |---------------------------------------------------------------|
#             |Write a method returning the number given times two, unless the
#             |number given is a double number, in which case return the number
#             |unchanged.
#       Input |An integer
#       Output|The integer itself, or the integer doubled
#       Edges |No integer -- ignored!
#       Rules |Double numbers are numbers with an even number of digits wherein
#             |  the digits on both sides are the same.
#             |If the argument integer is a double number, it is returned as is.
#             |If the argument is not a double number, return it multiplied by 2.
#   Questions |
# Example     |---------------------------------------------------------------|
# twice(37) == 74
# twice(44) == 44
# twice(334433) == 668866
# twice(444) == 888
# twice(107) == 214
# twice(103103) == 103103
# twice(3333) == 3333
# twice(7676) == 7676
# twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# twice(5) == 10
# Data        |---------------------------------------------------------------|
#             |I may use an array to verify whether or not the number is double.
# Algorithm   |---------------------------------------------------------------|
#             |First verify if the number is a double number.
#             |If the number has an even number of digits,
#             |  Cast it to a string, grab the middle index of the number, and
#             |    verify if the first half is the same as the second half.
#             |Based on these validations, return the number * 2 if it is not a
#             |double number, or number itself if it is.
# Code________|_______________________________________________________________|
#
def twice(num)
  cast_num = num.to_s
  is_double = false
  if cast_num.length.even?
    half_length = cast_num.length / 2
    first_half = cast_num[0...half_length]
    second_half = cast_num[half_length..-1]
    is_double = (first_half == second_half)
  end
  is_double ? num : num * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
