# Iterators: True for All

# Because this is so similar to the last exercise, pedac is skipped.
# Ultimately all that is needed is a swap in return logic.

def all?(collection)
  raise LocalJumpError, 'Block must be provided.' unless block_given?
  return true if collection.empty?
  collection.each { |elem| return false unless yield(elem) }
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true
