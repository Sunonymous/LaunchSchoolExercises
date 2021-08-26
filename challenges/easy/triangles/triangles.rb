# frozen_string_literal: true

# Triangles

# First, to set up the architecture.
# Triangle appears to be a class, passed in its side lengths as numbers.
#   If the combination of side lengths is invalid, an exception is raised.
#   If the side lengths form an altogether valid triangle, the type of triangle
#     is assigned to the instance variable 'kind', which a reader exists for.

# P
#   Create a triangle class which accepts three numbers as the length of the
#     triangle's sides. If the triangle is not valid, an exception should be
#     raised. If it is valid, the type of triangle is saved in a retrievable
#     instance variable.
#   Triangle Definitions:
#     Equilateral - Sides have equal length
#     Isosceles   - Two sides have equal length
#     Scalene     - Each side is different in length
#       (call uniq on an array of sides to find number of equal sides)
#   Universal Factors:
#     All triangles have lengths greater than 0
#     Adding any two sides together should result greater than the third side.
# examples in test cases
# data: Triangle class
# A
#   The first thing we should verify is whether or not the triangle is valid.
#   A separate method can be used to validate whether all sides are greater than
#     zero.
#   A separate method can be used to validate the combination of side lengths.
#     It will manually validate than every combination of two sides is greater
#       than the length of the third.
#   Once the triangle is validated, test the number of unique sides and based
#     on the result, assign the type of triangle as a string into @kind.
# C

class Triangle
  @@err_side_length = 'Triangles cannot have sides of zero or negative length.'
  @@err_side_combo  = 'The sides given cannot form a valid triangle.'
  attr_reader :kind

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    validate_triangle
    @kind = case unique_sides
            when 1 then 'equilateral'
            when 2 then 'isosceles'
            when 3 then 'scalene'
            end
  end

  private

  def validate_triangle
    raise ArgumentError, @@err_side_length unless positive_lengths?

    raise ArgumentError, @@err_side_combo unless valid_lengths?
  end

  def positive_lengths?
    @sides.all?(&:positive?)
  end

  def unique_sides
    @sides.uniq.size
  end

  def valid_lengths?
    s1 = @sides[0]
    s2 = @sides[1]
    s3 = @sides[2]
    comp1 = (s1 + s2) > s3
    comp2 = (s1 + s3) > s2
    comp3 = (s2 + s3) > s1
    comp1 && comp2 && comp3
  end
end
