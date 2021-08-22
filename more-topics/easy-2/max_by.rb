# Max By

# P
#   Write an emulation of Enumerable#max_by. This passes elements to a block
#     and returns the element which, when passed to a block returned the maximum
#     value.
#   If the array is empty, this method should return nil.
#   May use #each, #each_with_object, #each_with_index, #inject, #loop, #for,
#     #while, or #until to iterate. No other iteration is allowed.
# examples below
# data: array
# A
#   Initialize a variable, max_idx, at 0.
#   Initialize another two variables, max_val and now_val, to nil.
#   Iterate through the array with each. On each iteration, assign now_val to
#     the return value of passing the element to the block.
#   If now_val is greater than max_val, set max_idx to the index of element and
#     max_val to the value of now_val.
#   Return array[max_idx].
# C

def max_by(array)
  max_idx = 0
  max_val = nil
  now_val = nil
  array.each do |element|
    now_val = yield(element)
    if max_val.nil? || now_val > max_val
      max_idx = array.index(element)
      max_val = now_val
    end
  end
  array[max_idx] # this conveniently returns nil if array is empty
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
