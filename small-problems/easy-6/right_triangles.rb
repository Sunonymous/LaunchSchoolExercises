# Right Triangles
#
# Problem     |---------------------------------------------------------------|
#             |Given a positive integer, write a method to create and print a
#             |  right triangle using * to illustrate the shape.
#       Input |Positive Integer
#       Output|Right triangle printed to console using *
#       Edges |Negative Integers.
#       Rules |The hypotenuse should have one end at the lower-left and the other
#             |  end at the upper-right of the triangle.
#   Questions |
#             |
# Example     |---------------------------------------------------------------|
# triangle(5)
    # *
   # **
  # ***
 # ****
# *****
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |Loop through the numbers 1 through the integer given
#             |Print a right-justified series of * matching the index of the loop
# Code________|_______________________________________________________________|
#
def triangle(side)
  side.times { |idx| puts "#{('*' * (idx+1)).rjust(side)}"}
end

# Algorithm   |---------------------------------------------------------------|
#             |Expanding my thoughts a bit more here. To mirror vertically, we
#             |  need to reverse the order of the indexes printed. To make this
#             |  easier, we'll initialize that into an array and reverse if needed.
#             |Mirrored just changes the function we need to use on the string.
#

def triangle_fe(side, upside_down=false, mirrored=false)
  order = (1..side).to_a
  order.reverse! if upside_down
  if mirrored
    order.each { |idx| puts "#{('*' * (idx)).ljust(side)}"}
  else
    order.each { |idx| puts "#{('*' * (idx)).rjust(side)}"}
  end
end

triangle_fe(5)
triangle_fe(5, true, false)
triangle_fe(5, false, true)
triangle_fe(5, true, true)
