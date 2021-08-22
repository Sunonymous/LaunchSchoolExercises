# Each with Object

# P
#   Write a method emulating Enumerable#each_with_object. This method passes each
#     element in a collection and an object to a block. The block's return value
#     is not used. The object passed may be updated by the block. After the full
#     iteration, the object is returned.
#   If the given array is empty, the original object passed is returned.
#   May use #each, #each_with_index, #inject, #loop, #for, #while, or #until to
#     iterate, and only those methods (for iteration).
# examples below
# data: array
# A
#   Not even sure why these are being written. The description of the problem is
#     the description of the algorithm...
# C

def each_with_object(array, obj)
  # return obj if array.empty? # guess this is unnecessary
  array.each { |elem| yield(elem, obj) }
  obj
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}
