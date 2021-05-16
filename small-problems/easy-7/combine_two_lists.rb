# Combine Two Lists
#
# Problem     |---------------------------------------------------------------|
#             |Write a method taking two arrays and returning a new array with
#             |  the elements from each woven together in alternation.
#       Input |Two Arrays
#       Output|A new array with interwoven elements from the two input arrays.
#       Edges |Input validation not required.
#       Rules |Elements are of the same length and not empty.
#             |Elements must be added to the new array in alternation.
#   Questions |
# Example     |---------------------------------------------------------------|
# interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
# Data        |---------------------------------------------------------------|
#             |Arrays arrays arrays arrays arrays arrays. All day arrays.
# Algorithm   |---------------------------------------------------------------|
#             |I know the zip function exists. For practice I'll build it also
#             |  in the brute force way.
#             |Create an empty array, 'results'.
#             |Create a variable 'number_of_elements' as the size of input arrays.
#             |Start a loop from 0 to number_of_elements and add the element
#             |  from each array at that index to the resulting array.
#             |Return results.
# Code________|_______________________________________________________________|
#
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

def interleave(arr1, arr2)
  results = []
  number_of_elements = arr1.size - 1
  0.upto(number_of_elements) { |idx| results.append(arr1[idx], arr2[idx]) }
  results
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
