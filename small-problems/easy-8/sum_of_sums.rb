# Sum of Sums
#
# Problem     |---------------------------------------------------------------|
#             |Write a method which takes an array of numbers and returns the
#             |sum of each consecutive sum of integers as another is added.
#       Input |An array of integers.
#       Output|An integer, the sum of sums!
#       Edges |Empty arrays will not be given.
#       Rules |The resulting integer is the sum of every individual sum of each
#             |subsequence of integers within the input array.
#   Questions |
# Example     |---------------------------------------------------------------|
# sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35
# Data        |---------------------------------------------------------------|
#             |Arrays are given and used.
# Algorithm   |---------------------------------------------------------------|
#             |Create an integer 'total' to store the running sum.
#             |Create an index variable, length_idx, at 1.
#             |Start a loop that breaks when the index surpasses size of the array.
#             |In each iteration, create a sub array using a range from 0 and a
#             |  length of length_idx, add the sum of the sub-array to total 
#             |  and increment length_idx by one.
#             |Return total.
# Code________|_______________________________________________________________|
#
def sum_of_sums(int_array)
  total = 0
  length_idx = 1
  loop do
    sub_array = int_array[0, length_idx]
    total += sub_array.sum
    length_idx += 1
    break if length_idx > int_array.size
  end
  total
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35
