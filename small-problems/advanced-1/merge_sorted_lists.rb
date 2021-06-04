# Merge Sorted Lists
#
# Problem     |---------------------------------------------------------------|
#             |Given two sorted arrays, return a new array with all elements in
#             | sorted order.
#       Input |Two sorted arrays.
#       Output|A new array, with all elements sorted.
#       Edges |Empty arrays
#             |
#       Rules |Cannot sort an array at the end. Must do so programmatically.
#             |Should not mutate the input arrays.
#             |
#   Questions |Does having them individually sorted modify the approach?
#             |
# Example     |---------------------------------------------------------------|
# merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# merge([], [1, 4, 5]) == [1, 4, 5]
# merge([1, 4, 5], []) == [1, 4, 5]
# Data        |---------------------------------------------------------------|
#             |Array? [x]
# Algorithm   |---------------------------------------------------------------|
#             |First attempt, let's start a loop while the size of either array
#             |  is greater than 1. Then start a conditional, which checks if 
#             |  arr1 is non-empty, and if so, unshift or push the first element
#             |  depending on whether or not it is less than or greater than the
#             |  element in results.
#             |Not so well, that one. How about if it iterates through the ems
#             |  already in the results array and inserts itself at the point
#             |  where it finds one greater or equal to itself?
# Code________|_______________________________________________________________|
#
require 'pry-byebug'

def get_placement(array, query)
  array.each_with_index do |em, idx|
    return idx if em >= query
  end
  -1
end

# puts get_placement([1, 2, 3, 4, 5], 6)

def merge(arr1, arr2)
  results = []
  arr1 = arr1.dup
  arr2 = arr2.dup
  while !arr1.empty? || !arr2.empty?
    if results.empty?
      results.push(arr1.shift) if !arr1.empty?
      results.push(arr2.shift) if !arr2.empty?
    end
    if !arr1.empty?
      em = arr1.shift
    elsif !arr2.empty?
      em = arr2.shift
    end
    idx = get_placement(results, em)
    results.insert(idx, em)
  end
  results
end

puts merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge([], [1, 4, 5]) == [1, 4, 5]
puts merge([1, 4, 5], []) == [1, 4, 5]
