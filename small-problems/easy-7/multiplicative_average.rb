# Multiplicative Average
#
# Problem     |---------------------------------------------------------------|
#             |Given an array of integers, return the results of multiplying them
#             |  together and dividing by the number of integers, rounded to .000
#       Input |Array of integers
#       Output|The product of all the integers, divided by the number of integers.
#       Edges |Empty arrays are to be ignored.
#       Rules |The resulting number must be rounded to three decimal places.
#             |
#   Questions |
#             |
# Example     |---------------------------------------------------------------|
# show_multiplicative_average([3, 5])                # => The result is 7.500
# show_multiplicative_average([6])                   # => The result is 6.000
# show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
# Data        |---------------------------------------------------------------|
#             |N/A -- Just a calculation
# Algorithm   |---------------------------------------------------------------|
#             |Multiply all the numbers together.
#             |Divide the result of the multiplication by the number of integers.
#             |Round to three decimal places.
# Code________|_______________________________________________________________|
#
def show_multiplicative_average(int_array)
  (int_array.inject(:*)/int_array.size.to_f).round(3)
end

puts show_multiplicative_average([3, 5])                # => The result is 7.500
puts show_multiplicative_average([6])                   # => The result is 6.000
puts show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
