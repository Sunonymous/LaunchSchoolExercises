# Running Totals
#
# Problem
#   Given an array of numbers, return an array of the same size, where
#   the first number is identical and the follow numbers track the running sum.
#   Input -> Array of numbers
#   Output -> Array of numbers with same size
#   Edge Cases -> Empty array
# Example
#   [2, 5, 13] -> [2, 7, 20]
#   [14, 11, 7, 15, 20] -> [14, 25, 32, 47, 67]
# Data Structure
#   Using arrays... naturally.
# Algorithm
#   I think it makes sense to use shifting for this one. While the array has an
#   element, pop it, add it to the previous number as a new element.
# Code
#
def running_total(numray)
  results = []
  while !numray.empty?
    results.push numray.shift if results.empty?
    break if numray.empty?
    next_num = numray.shift
    results.push (next_num + results.last)
  end
  results
end

# Hmm. I didn't consider using map, although it does make sense... 
# I'll try with the other methods in further exploration.
def running_total_fe(numray)
  total = 0
  results = numray.each_with_object([]) do |em, ar|
    total += em
    ar << total
  end
  results
end
