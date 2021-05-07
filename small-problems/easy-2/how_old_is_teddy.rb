# How Old is Teddy
#   (or, the generation of random numbers as applied to a fictional entity)
#
# Problem
#   Input -> N/A
#   Output -> Formatted string containing a randomly-generated number.
#   Edges -> N/A
#   Model -> Generate a random number between 20 and 200 and interpolate it into
#     a string for outputting.
# Examples
#   "Teddy is 69 years old!"
# Data Structure
#   N/A
# Algorithm
#   Make use of the Random class in Ruby to generate a random number.
#   (This one wasn't really worth PEDAC... Oh well. Building habits, right?)
# Code
#
def get_teddy_age
  return "Teddy is #{rand(20..200)} years old!"
end

puts get_teddy_age
