# Iterator: True for Any?

# P
#   Compose a basic #any? method, taking an array as an argument and returning
#     true if any of the elements inside return true from an implicitly-passed
#     block.
#   Method stops execution and returns true if a single element returns true.
#   Method returns false immediately upon being given an empty array.
#   May not use Array#all?, Array#any?, Array#none?, or Array#one?
# examples below
# data: Arrays
# A
#   Seems like we can use Array#each in implementation to iterate through items.
#   Raise exception if no block is given.
#   Return false if the array is empty.
#   Iterate over the items in the array, yielding each to the block and returning
#     true if any of the blocks return true.
#   Return false if no truthy return is encountered before this point.
# C

def any?(array)
  raise LocalJumpError, "Block must be provided." unless block_given?
  return false if array.empty?
  array.each do |elem|
    return true if yield(elem)
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
