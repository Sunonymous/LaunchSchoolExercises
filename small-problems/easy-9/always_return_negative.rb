# Always Return Negative
#
# Problem     |---------------------------------------------------------------|
#             |Given an integer as an argument, if said integer is positive,
#             |return its negative equivalent. If negative or 0, return original
#       Input |An integer.
#       Output|The negative version of said integer.
#       Edges |Tests suggest we're not validating input.
#       Rules |Returned integer must be negative
#   Questions |
# Example     |---------------------------------------------------------------|
# negative(5) == -5
# negative(-3) == -3
# negative(0) == 0      # There's no such thing as -0 in ruby
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |Check if the number is less than or equal to zero.
#             |  If so, return the number unchanged. 
#             |If not, then return the number times -1.
#             |
# Code________|_______________________________________________________________|
#
def negative(num)
  num <= 0 ? num : num * -1
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0      # There's no such thing as -0 in ruby

# I'd say that short version is not superior because it's not immediately obvious
# what is happening, and it could be misconstrued based on the order of operations.
