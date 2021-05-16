# Halvsies
#
# Problem     |---------------------------------------------------------------|
#             |Given an array, return a nested array with two inner arrays, the
#             |  first containing the first half of the original, and the second
#             |  the second half.
#       Input |An array 'arr'
#       Output|A new, nested array, 'results'
#       Edges |Empty array, array with odd number of elements.
#       Rules |If the given array has an odd number of elements, let the first
#             |  half be larger. This includes arrays with only a single element.
#             |If the given array is empty, the resulting array should be [[],[]]
#   Questions |
# Example     |---------------------------------------------------------------|
# halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# halvsies([5]) == [[5], []]
# halvsies([]) == [[], []]
# Data        |---------------------------------------------------------------|
#             |*sigh* arrays.
# Algorithm   |---------------------------------------------------------------|
#             |Create an array 'results' with two empty arrays as elements.
#             |Create a clone of arr to prevent mutation.
#             |Return results if the length of the array is 0.
#             |If the length of the array is 1, add the element to the first
#             |  inner array of results and return results.
#             |Create a variable 'midpoint' and set it to (arr.size / 2) + 1 if 
#             |  the length of arr is odd and arr.size / 2 if not.
#             |Shift the first element of clone midpoint number of times into arr[0]
#             |Shift the remaining elements in clone into arr[1]
#             |Return results
# Code________|_______________________________________________________________|
#
def halvsies(arr)
  results = [[], []]
  clone = arr.clone
  return results if arr.size == 0
  return [arr, []] if arr.size == 1
  midpoint = arr.size.odd? ? (arr.size / 2) + 1 : (arr.size / 2)
  midpoint.times { results[0].push(clone.shift)}
  clone.each { |em| results[1].push(em)}
  results
end
# I like the simplicity of their version!
def halvsies(arr)
  half = (arr.size / 2.0).ceil
  first = arr[0, half]
  second = arr[half..-1]
  [first, second]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
