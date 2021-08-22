# Each Cons

# P
#   Rewrite Enumerable#each_cons. This method takes an array and passes each pair
#     of elements to a block for processing. The method returns nil.
#   May use #each, #each_with_object, #each_with_index, #inject, loop, for, while,
#     or until to iterate, and no others.
# examples below
# data: array
# A
#   Clone the array and save it in a variable, copy.
#   Initialize a variable, pair, as an empty array.
#   Start a loop. Until copy is empty or pair has two elements, shift an element
#     out of copy into the pair array.
#        Yield the elements in the pair array to the block.
#   Return nil.
#   
# C

# Oops, the method written is not quite the same as the method needed. 
# This method does not repeat elements. Let's write another that does.
def each_cons(array)
  copy = array.clone
  pair = []
  loop do
    pair << copy.shift until copy.empty? || pair.size == 2
    pair.size > 1 ? yield(pair.first, pair.last) : yield(pair.first)
    pair.clear
    break if copy.empty?
  end
  nil
end

# This one should be tracked with a numerical index counter.
def each_cons(array)
  index = 0
  while index < array.size - 1
    yield(array[index], array[index + 1])
    index += 1
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
