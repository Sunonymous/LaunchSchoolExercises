# Count Items

# The last solution used is close enough to use again.

def count(array, key = true)
  returns = Hash.new(0)
  array.each { |elem| returns[yield(elem)] += 1 }
  returns[key]
end

def count_fe(array, key = true)
  returns = Hash.new(0)
  for elem in array do
    returns[yield(elem)] += 1
  end
  returns[key]
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
