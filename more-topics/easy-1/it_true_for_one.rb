# Iterator: True for One?

# Little more complex, this one.

# P
#   Write a method, #one?, passed a collection, which returns true if only a single
#   element returns true from a given block.
#   If the block returns true more than once, the method should return false.
#   May not use #all?, #any?, #none?, or #one?
# examples below
# data: whatever collection is given
# A
#   Return false if collection is empty, and raise exception without block.
#   Create a hash with a default value of 0.
#   Iterate through the elements in the collection.
#     On each iteration, add one to to hash value with a key of the return value.
#   After the iteration, return the evaluation that hash[true] == 1
# C

def one?(collection)
  raise LocalJumpError, 'Block must be provided.' unless block_given?
  # This happens on its own, though its practice for integrating my own error handling.
  return false if collection.empty?

  returns = Hash.new(0)
  collection.each do |elem|
    returns[yield(elem)] += 1
    return false if returns[true] > 1
  end
  returns[true] == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    == true
p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
p one?([2, 4, 6, 8]) { |value| value.even? }    == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true }           == false
p one?([1, 3, 5, 7]) { |value| false }          == false
p one?([]) { |value| true }                     == false
