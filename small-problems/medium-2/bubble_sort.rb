# Bubble Sort
#
# Problem     |---------------------------------------------------------------|
#             |Sort a given array, destructively, using the bubble sorting
#             |algorithm.
#       Input |An array of at least two elements.
#       Output|The same array sorted.
#       Edges |Empty arrays (ignored)
#       Rules |Sorting must be done via the bubble algorithm
#             |Compare each pair sequentially, if the former is greater, swap
#             |  the two elements.
#             |Sorting is done when a pass terminates with no swaps.
#   Questions |
# Example     |---------------------------------------------------------------|
# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]
#
# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]
#
# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# Data        |---------------------------------------------------------------|
#             |Arrays hooray arrays
# Algorithm   |---------------------------------------------------------------|
#             |Start a loop.
#             |Create a variable, swaps, and initialize it to false.
#             |Iterate from 0 to length of array minus 2
#             |Each iteration, compare the elements at idx i and i + 1
#             |If the latter is less than the former, change their position
#             |  and set swaps to true
#             |If swaps is true, go to the next iteration.
#             |Return array
# Code________|_______________________________________________________________|
#
def bubble_sort!(arr)
  loop do
    swaps = false
    last_index = arr.size - 2
    (0..last_index).each do |idx|
      comp = arr[idx] <=> arr[idx + 1]
      if comp > 0
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        swaps = true
      end
    end
    last_index -= 1
    next if swaps
    break if !swaps
  end
  arr
end

array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
