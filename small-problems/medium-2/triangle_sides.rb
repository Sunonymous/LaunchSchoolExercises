# Triangle Sides
#
# Problem     |---------------------------------------------------------------|
#             |Given three numbers, return the type of triangle formed with the
#             |length of the sides equal to the numbers given, or invalid if a
#             |triangle may not be formed with those lengths.
#       Input |Three numbers.
#       Output|A symbol, :equilateral , :isosceles , :scalene , or :invalid
#       Edges |Zero sides
#       Rules |Equilateral triangles have sides with equal lengths.
#             |Isosceles have two sides with equal length and one different.
#             |Scalene triangles have all different lengths.
#             |The sum of the two shorter sides must be greater than the longest
#             |  side in order for the triangle to be valid.
#             |All lengths must be greater than 0.
#   Questions |
# Example     |---------------------------------------------------------------|
# triangle(3, 3, 3) == :equilateral
# triangle(3, 3, 1.5) == :isosceles
# triangle(3, 4, 5) == :scalene
# triangle(0, 3, 3) == :invalid
# triangle(3, 1, 1) == :invalid
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |Return :invalid if any side is 0 or less.
#             |Create an array containing the side lengths and sort it.
#             |Return :equilateral if calling uniq on the array equals one.
#             |Return :isosceles if calling uniq on the array equals two and 
#             |  the sum of the first two elements in the array is greater than
#             |  the third element.
#             |Return :scalene if the sum of the first two elements exceeds the
#             |  third
#             |Return :invalid
# Code________|_______________________________________________________________|
#
def triangle(side1, side2, side3)
  return :invalid if side1 <= 0 || side2 <= 0 || side3 <= 0
  sides = [side1, side2, side3].sort
  same = sides.uniq.size
  return :equilateral if same == 1
  valid = sides[0] + sides[1] > sides[2]
  return :isosceles if same == 2 && valid
  return :scalene if valid
  :invalid
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
