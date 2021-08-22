# Each with Index

# P
#   Write a version of Enumerable#each_with_index. This method iterates over a
#   collection and passes each element with its index to a block, eventually
#   returning the collection itself. The block's return value is unused.
#   May use #each, #each_with_object, #inject, #loop, #for, #while, or #until
#     to loop, and no other iteration methods.
# examples below
# data: array
# A
#   There really isn't much to this... iterate over the collection and yield the
#     object elements and their indices.
#   Return collection.
# C

def each_with_index(array)
  array.each do |elem|
    yield(elem, array.index(elem))
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
