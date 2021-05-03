# Repeat Yourself
# Practicing the PEDAC Process.
# Problem
#   Two inputs, one output.
#   Input -> String, Positive Integer
#   Output -> String, repeated
#   Edges -> Negative Integer
#   Model: an input string is repeated the number of times specified.
# Example
#   repeat('Hello', 3) >> "Hello\nHello\nHello"
# Data Structure
#   N/A
# Algorithm
#   No change to the input is necessary.
# Code
# I'd like to try to be a little creative with the syntax.
# Create an array with times element of the default value str.
# Join it with multiplication syntax.

def repeat(str, times)
  return if times <= 0
  puts Array.new(times, str) * "\n"
end

repeat("LOVE", -30)
