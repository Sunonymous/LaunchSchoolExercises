# Sum Square - Square Sum
#
# Problem     |---------------------------------------------------------------|
#             |Given a positive integer, write a method returning the difference
#             |between the square of the sum of the first n numbers and the sum
#             |of the squares of the first n numbers.
#       Input |A positive integer.
#       Output|A positive integer.
#       Edges |Negative numbers.
#       Rules |To calculate the sum of squares, take every number from 1 to n,
#             |  square it and add to the total.
#             |To calculate the square of the sums, add all numbers from 1 to n
#             |  and square that.
#   Questions |
# Example     |---------------------------------------------------------------|
# sum_square_difference(3) == 22
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |Calculate the sum of the squares.
#             |Calculate the square of the sums.
#             |Subtract the latter from the former and return the result!
# Code________|_______________________________________________________________|
#
def sum_square_difference(num)
  range = (1..num)
  sum_squares = range.to_a.reduce { |memo, n| memo + n**2 }
  square_sum = (range.to_a.sum)**2
  square_sum - sum_squares
end

puts sum_square_difference(3) == 22
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150
