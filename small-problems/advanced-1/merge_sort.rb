# Merge Sort
#
# Problem     |---------------------------------------------------------------|
#             |Sort an array of passed values using the merge sort algorithm.
#             |
#       Input |Array of values
#       Output|Sorted array of values.
#       Edges |
#             |
#       Rules |Given array will only contain one type of data: numbers or strings.
#             |
#   Questions |
#             |
# Example     |---------------------------------------------------------------|
# merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# merge_sort([5, 3]) == [3, 5]
# merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
# Data        |---------------------------------------------------------------|
#             |
# Algorithm   |---------------------------------------------------------------|
#             |Uses two functions. I will be rewriting the merge function from
#             |  the previous exercise to comply with this code.
#             |Mergesort takes an array, arr.
#             |If the array has only one element, return it.
#             |Create two new arrays, splitting the given array in half.
#             |Call this mergesort function on each new array.
#             |Return the merge function, passing in the two new lists.
#             |Merge takes two arrays.
#             |Create a new array, arr3.
#             |While there are still elements in arr1 and arr2
#             |  If the first element of arr1 is greater than the first element
#             |    of arr2, add arr2's to the end of arr3. Otherwise, add arr1's
#             |While there are still elements in arr1, add them to the end of arr3
#             |While arr2 still has elements, remove them and add to the end of arr3
#             |Return arr3
# Code________|_______________________________________________________________|
#
def merge(arr1, arr2)
  arr3 = []
  while !arr1.empty? && !arr2.empty?
    em = arr1.first > arr2.first ? arr2.shift : arr1.shift
    arr3.push(em)
  end
  arr3.push(arr1.shift) until arr1.empty?
  arr3.push(arr2.shift) until arr2.empty?
  arr3
end

def merge_sort(array)
  size = array.size
  return array if size == 1
  sub1 = array[0...size/2]
  sub2 = array[size/2...size]
  sub1 = merge_sort(sub1)
  sub2 = merge_sort(sub2)
  return merge(sub1, sub2)
end

puts merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
puts merge_sort([5, 3]) == [3, 5]
puts merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
puts merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
puts merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
