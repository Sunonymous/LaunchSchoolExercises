# Reversed Arrays Part 1
#
# Problem     |---------------------------------------------------------------|
#             |Given an array, return the same array with its elements in
#             |  reversed order.
#       Input |Array 'arr'
#       Output|Mutated array 'arr' with elements in reverse order.
#       Edges |Empty arrays.
#       Rules |The elements in the given array are returned in reversed order.
#             |The elements themselves are not altered in any way.
#             |May NOT use Array#reverse or Array#reverse!
#   Questions |
# Example     |---------------------------------------------------------------|
# list = [1,2,3,4]
# result = reverse!(list)
# result == [4, 3, 2, 1] # true
# list == [4, 3, 2, 1] # true
# list.object_id == result.object_id # true
#
# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"] # true
# list == ["c", "d", "e", "b", "a"] # true
#
# list = ['abc']
# reverse!(list) == ["abc"] # true
# list == ["abc"] # true
#
# list = []
# reverse!(list) == [] # true
# list == [] # true
# Data        |---------------------------------------------------------------|
#             |Arrays, obviously.
# Algorithm   |---------------------------------------------------------------|
#             |If the length of arr is 0 or 1, return arr.
#             |Create a temporary array to hold the elements, temp_arr.
#             |Create an array through a negative range, indices, using the
#             |  length of the array - 1 to start.
#             |Iterate through indices, adding each of the elements at the given
#             |  index to temp_arr
#             |Iterate through temp_arr with index, assigning each of the elements
#             |  to the original array.
#             |Return arr.
# Code________|_______________________________________________________________|
#
def reverse!(arr)
  return arr if arr.size <= 1
  temp_arr = []
  indices = (arr.size - 1..0).step(-1).to_a
  indices.each { |idx| temp_arr.push arr[idx] }
  temp_arr.each_with_index { |elem, idx| arr[idx] = elem }
  arr
end

# I'm including part two here because it is so similar.

def reverse(arr)
  new_arr = []
  for idx in (arr.size - 1..0).step(-1).to_a
    new_arr.push arr[idx]
  end
  new_arr
end

# further exploration
def reverse(arr)
  (arr.size - 1..0).step(-1).to_a.each_with_object([]) {|idx, a| a << arr[idx]}
end

def reverse(arr)
  (arr.size - 1..0).step(-1).to_a.reduce([]) { |memo, idx| memo << arr[idx] }
end

# list = [1,2,3,4]
# result = reverse!(list)
# puts result == [4, 3, 2, 1] # true
# puts list == [4, 3, 2, 1] # true
# puts list.object_id == result.object_id # true
#
# list = %w(a b e d c)
# puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
# puts list == ["c", "d", "e", "b", "a"] # true
#
# list = ['abc']
# puts reverse!(list) == ["abc"] # true
# puts list == ["abc"] # true
#
# list = []
# puts reverse!(list) == [] # true
# puts list == [] # true

# Part 2
puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true
