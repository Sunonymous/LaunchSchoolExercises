# Rotation Part 1
#
# Problem     |---------------------------------------------------------------|
#             |Given an array, rotate it so that the first element is moved to
#             |the end of the array. The original array should not be modified.
#       Input |Array
#       Output|Array with the first element moved to the end.
#       Edges |Arrays with single elements.
#             |Empty arrays.
#       Rules |The original array must not be modified through the method.
#             |The returned array will contain the same number of elements.
#             |The returned array will have the input array's first element at
#             |  the end.
#   Questions |
# Example     |---------------------------------------------------------------|
# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']
#
# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true
# Data        |---------------------------------------------------------------|
#             |Arrrrays. Does it need to be said?
# Algorithm   |---------------------------------------------------------------|
#             |Duplicate the array given.
#             |Append the first (shifted) element of the duplicate to the 
#             |  end of the duplicate array and return it.
# Code________|_______________________________________________________________|
#
def rotate_array(arr)
  clone = arr.dup
  clone.push(clone.shift)
end

def rotate_string(str)
  chars = str.chars
  rotate_array(chars).join
end

def rotate_int(num)
  digits = num.to_s.chars
  rotate_array(digits).join.to_i
end

# puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# puts rotate_array(['a']) == ['a']
# x = [1, 2, 3, 4]
# puts rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true
puts rotate_string('hi there')
puts rotate_int(543)
