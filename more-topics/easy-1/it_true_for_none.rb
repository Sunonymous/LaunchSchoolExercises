# Iterator: True for None?

def none?(collection)
  # return true if collection.empty? # Guess this line isn't necessary!
  raise LocalJumpError, 'Block must be provided.' unless block_given?
  collection.each { |elem| return false if yield(elem) }
  true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
