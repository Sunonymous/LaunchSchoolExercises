# Seeing Stars
#
# Problem     |---------------------------------------------------------------|
#             |Write a method to display an 8-pointed star in a grid, n x n,
#             |  where n is a given odd integer.
#       Input |Odd Integer Size of Grid
#       Output|Star of size n * n with 8 points.
#       Edges |n < 7, n > terminal width
#             |
#       Rules |N will not be less than 7.
#             |Star must be comprised of asterisks and spaces.
#             |Star must have eight points. The center line counts for two.
#   Questions |
# Example     |---------------------------------------------------------------|
# star(7)
# *  *  *
 # * * *
  # ***
# *******
  # ***
 # * * *
# *  *  *
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |We will be tracking the inner spaces until all the stars come 
#             |  together.
#             |Each line has a number of spaces of n-3. The outermost line has
#             |  inner_spaces of n-3, though this decreases by 2 each line.
#             |Create a loop tracking inner_spaces until it gets to 0, each time
#             |  adding outer_spaces (n-inner_spaces)/2, then * then 
#             |  inner_spaces / 2, then * then inner_spaces / 2
#             |Save a reversed copy of this once inner_spaces reaches 0
#             |Add * times n
#             |Print first array plus second array.
# Code________|_______________________________________________________________|
#
def star(size)
  inner_spaces = size - 3
  outer_spaces = 0
  upper_half = []
  until inner_spaces <= -2
    out_gap = ' ' * (outer_spaces)
    in_gap = ' ' * (inner_spaces / 2)
    upper_half.push("#{out_gap}*#{in_gap}*#{in_gap}*#{out_gap}")
    inner_spaces -= 2
    outer_spaces += 1
  end
  lower_half = upper_half.reverse
  puts upper_half, "#{'*' * size}", lower_half
end

star(25)
