# Tri-Angles
#
# Problem     |---------------------------------------------------------------|
#             |Given three integer angles, return the type of triangle based on
#             |the angles given, or invalid if the triangle is not valid.
#       Input |Three integer numbers of the angles in a triangle.
#       Output|A symbol, :right , :acute , :obtuse , or :invalid
#       Edges |Improper input cases are to be ignored.
#             |Angles of zero.
#       Rules |Right triangles have one angle which is 90 degrees.
#             |Acute triangles have three angles which are less than 90 degrees.
#             |Obtuse triangles have one angle which is greater than 90 degrees.
#             |All angles must sum to 180 and be greater than 0.
#   Questions |
# Example     |---------------------------------------------------------------|
# triangle(60, 70, 50) == :acute
# triangle(30, 90, 60) == :right
# triangle(120, 50, 10) == :obtuse
# triangle(0, 90, 90) == :invalid
# triangle(50, 50, 50) == :invalid
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |Return :invalid if the sum of the angles is different than 180
#             |  or if a side is 0
#             |Create an array containing the sides.
#             |Return :right if 90 is in array.
#             |Return :acute if all degrees in array are less than ninety.
#             |Return :obtuse if one angle is greater than 90.
#             |Return :invalid ? This may not be necessary.
#             |  Don't think it is...
# Code________|_______________________________________________________________|
#
def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  return :invalid if sides.sum != 180 || sides.any?(0)
  return :right if sides.include?(90)
  return :acute if sides.all? { |side| side < 90 }
  return :obtuse if sides.any? { |side| side > 90 }
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
