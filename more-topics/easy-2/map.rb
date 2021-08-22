# Map

# P
#   Write a method to emulate Array#map. It is passed an array and a block, and
#     returns a new array containing the same amount of elements, although each
#     object in the returned array is the return value of yielding the current
#     element to the block.
#   May use #each, #each_with_object, #each_with_index, #inject, #loop, #for, 
#     #while, or #until to iterate, and no other iteration methods.
# examples below
# data: arrays
# A
#   The array will need to be iterated through.
#   Create a results array, empty.
#   Iterate through the given array and yield each element to the block, pushing
#     the return value to the results array.
#   Return results.
# C

def map(array)
  results = []
  array.each { |elem| results << yield(elem) }
  results
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
hasher = { dog: 'Dingo', cat: 'Susanna' }
p map(hasher) { |key, val| "#{val}<-#{key}" }
