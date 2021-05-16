# Combining Arrays
#
# Problem     |---------------------------------------------------------------|
#             |Write a method which combines two arrays without duplicate values.
#       Input |Two arrays, arr1 and arr2.
#       Output|A single new array which contains all values from arr1 and arr2
#             |  without any duplicate values.
#       Edges |
#       Rules |There may only be one of each value in the output array.
#             |
#   Questions |Must the output array be a new object? Unclear.
#             |
# Example     |---------------------------------------------------------------|
# merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
# Data        |---------------------------------------------------------------|
#             |We will be using... wait for it... arrays.
# Algorithm   |---------------------------------------------------------------|
#             |Create a new empty array, 'results'.
#             |Iterate through the first and second arrays, appending each value
#             |  to the results array if it is not already present.
#             |Return results.
# Code________|_______________________________________________________________|
#
def merge(arr1, arr2)
  results = []
  arr1.each { |em| results << em unless results.include?(em) }
  arr2.each { |em| results << em unless results.include?(em) }
  results
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
