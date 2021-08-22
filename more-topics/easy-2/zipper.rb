# Zipper

# P
#   Write a method emulating the Array#zip method. It accepts two arrays and 'zips'
#     them together, returning a array of subarrays containing pairs of an element
#     from each array.
#   The returned array should be a new array.
#   The argument arrays will have the same number of elements.
# example below
# data: arrays (imagine this!)
# A
#   Initialize an index variable at 0.
#   Create a results array.
#   Start a loop from 0 to the length of the arrays (- 1), and during each
#     pass, add an array consisting of the items from both arrays at that index.
#   Return results array.
# C

def zip(array1, array2)
  raise ArgumentError, 'Arrays must be of equal length!' if array1.size != array2.size
  results = []
  index = 0
  until index == array1.size
    results << [array1[index], array2[index]]
    index += 1
  end
  results
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
