# Drop While

# P
#   Write a method to emulate Enumerable#drop_while. This method iterates through
#     an array, passing each element to a block. If the block returns true, the 
#     element is considered 'dropped'. When the method encounters an element which
#     returns false from the block, the iteration stops and the method returns a
#     new array of all the elements from the falsy element until the end.
#   If the array is empty or all elements return true, return an empty array.
#   May use #each, #each_with_object, #each_with_index, #inject, #loop, #for,
#     #while, or #until to iterate. No other iteration methods may be used.
# examples below
# data: arrays
# A
#   Create a variable, 'falsy' and initilize it to nil.
#   Start a loop to iterate over the array. For each element, yield the element
#     to the block. If the return is falsy, set the falsy variable to the index
#     of the object.
#     Check if the value of falsy is nil. If not, break the loop.
#   If falsy is nil, return an empty array. If not, return a slice of the array
#     from index falsy to the end.
# C

def drop_while(array)
  return [] if array.empty?
  falsy = nil
  index = 0
  loop do
    falsy = index unless yield(array[index])
    break if falsy || index == array.size - 1
    index += 1
  end
  falsy ? array[falsy..-1] : []
end

def drop_while(array)
  # theirs was a similar idea to mine, with cleaner execution
  index = 0
  while index < array.size && yield(array[index])
    index += 1
  end
  array[index..-1]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
