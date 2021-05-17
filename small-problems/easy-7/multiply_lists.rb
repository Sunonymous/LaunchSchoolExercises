# Multiply Lists
#
# Problem     |---------------------------------------------------------------|
#             |Given two arrays where each array contains a list of numbers,
#             |return a new array where the numbers from each array  with the 
#             |same index are multiplied together.
#       Input |Two arrays of numbers.
#       Output|A single array where each pair at the same index are multiplied.
#       Edges |Arrays with differing lengths are to be ignored.
#             |Empty array.
#       Rules |The resulting array must be of the same legnth as the input arrays.
#             |Each index of the returned array should equal the product of the
#             |  elements at the same index of the input arrays.
#             |Array inputs will be of the same size.
#   Questions |
# Example     |---------------------------------------------------------------|
# multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
# Data        |---------------------------------------------------------------|
#             |Uses arrrrrrrrrrrrays.
# Algorithm   |---------------------------------------------------------------|
#             |Create an empty array, results.
#             |Create an index variable at 0 to track position.
#             |Loop until index is input array size - 1.
#             |On each iteration, add the produce of the elements at the index
#             |  from both arrays.
#             |Return results.
# Code________|_______________________________________________________________|
#
def multiply_list(arr1, arr2)
  results = []
  idx = 0
  until idx >= arr1.size
    results << arr1[idx] * arr2[idx]
    idx += 1
  end
  results
end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |array| array.inject(:*) }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
