# Find Missing Numbers

# P
#   Given a sorted array of integers, return an array of all the integers missing
#   between the highest and the lowest.
#   Integers may be positive or negative. Each integer will only appear once.
# Examples below.
# Data: Arrays and Range
# A
#   Use the first and last elements of the array to define a range.
#   Create a new array, 'results'.
#   Iterate over the range, and add each number to results if it is not included
#     in the initial array.
#   Return results.
# C

def missing(array)
  results = []
  (array.first...array.last).each do |num|
    results << num unless array.include?(num)
  end
  results
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
