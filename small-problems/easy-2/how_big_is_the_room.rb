# How Big is the Room
#
# Problem
#   Input -> Length and width in meters of a room
#   Output -> Square meters and square feet of the room
#   Edges -> N/A (no validation needed)
#   Model -> Provide the dimensions of the room and the program
#     outputs the calculated surface area.
# Example
#   Length of 10, width of 7 >> 70.0 m2 and 753.47 ft2
# Data Structure
#   N/A, just a calculation
# Algorithm
#   For calculation surface area, use length * width
#   For conversion to feet, use area * 10.7639
# Code
#

METER_TO_FEET = 10.7639
FEET_TO_INCH = 12
INCH_TO_CENTIMETER = 2.54

def calc_room_size_m
  puts "What is the length of the room in meters?"
  length = gets.chomp.to_f
  puts "What is the width of the room in meters?"
  width = gets.chomp.to_f
  area = length * width
  area_feet = area * METER_TO_FEET
  puts "The area of the room is #{area} m2"
  puts "The area of the room in feet is #{area_feet} ft2"
end

def calc_room_size_f
  puts "What is the length of the room in feet?"
  length = gets.chomp.to_f
  puts "What is the width of the room in feet?"
  width = gets.chomp.to_f
  area = length * width
  area_inch = area * FEET_TO_INCH
  area_centimeter = area_inch * INCH_TO_CENTIMETER
  puts "The area of the room is #{area} ft2"
  puts "The area of the room in inches is #{area_inch} in2"
  puts "The area of the room in centimeters is #{area_centimeter} cm2"
end

calc_room_size_f

# Afterthoughts
# I followed the instructions in the solution to get rid of my "magic number"
#   and use a constant for the conversion. That's a habit to build.
