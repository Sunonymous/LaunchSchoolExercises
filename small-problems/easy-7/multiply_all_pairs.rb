# Multiply All Pairs
#
# Problem     |---------------------------------------------------------------|
#             |With an input of two arrays of numbers, create a method that
#             |returns an array consisting of every product possible of 
#             |combinations of all pairs between the two arrays.
#       Input |Two arrays of numbers.
#       Output|A sorted array of all possible products between pairs of the array elements.
#       Edges |Empty arrays are to be ignored as a possibility
#       Rules |Products must be sorted in increasing order.
#             |Products may occur more than once within the returned array.
#   Questions |
# Example     |---------------------------------------------------------------|
# multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
# Data        |---------------------------------------------------------------|
#             |Arrayaaaays.
# Algorithm   |---------------------------------------------------------------|
#             |I will play with this using built-in methods and also brute force
#             |for practice.
#             |Create an empty array, results
#             |Loop through the first array
#             |With every number, loop through the second array and append the 
#             |product of the two numbers to the results array.
#             |Sort the resulting array and return it.
# Code________|_______________________________________________________________|
#
def multiply_all_pairs(arr1, arr2)
  results = []
  arr1.each do |num1|
    arr2.each do |num2|
      results << num1 * num2
    end
  end
  results.sort
end

def multiply_all_pairs(arr1, arr2)
  (arr1.product(arr2).map { |array| array.reduce(:*) }).sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
