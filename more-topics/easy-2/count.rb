# Count

# P
#   Write a method emulating Enumerable#count, though this time, it should iterate
#     through a series of passed arguments instead of an array.
#   Without arguments, the function should return 0.
#   With arguments given, the method should return the number of times the block
#     returns true.
# examples below
# data: array in transit
# A
#   Convert the arguments given into an array via the splat operator.
#   Create a returns hash with a default value of zero.
#   Iterate over the arguments array and add the return value to the returns hash.
#     (It was realized that the return value needs casting to a boolean value!)
#   Return returns[true].
# C

def count(*args)
  returns = Hash.new(0)
  args.each { |elem| returns[!!yield(elem)] += 1 }
  returns[true]
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
