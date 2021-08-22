# From-to-Step Sequence Generator

# P
#   Write a method to emulate the functionality of Range#step, which takes three
#     arguments, a starting value, an ending value, and a step value.
#   The method will start at the starting value and pass it to a block before
#     incrementing the value by the step value. The new value is passed to the
#     block and this repeats until the ending value is achieved or exceeded.
#   The function returns the original range.
# examples below
# data: maybe a range, a block
# A
#   instead of operating on a range, let's just use a standard loop.
#   Initialize a local variable index to the starting value.
#   Start a loop, in which the method yields the index to the block.
#     Inside the loop, break the loop if the index is greater than the ending value.
#     Otherwise, yield the index to the block.
#   Return a range from starting value to ending value.
# C

def step(start_val, end_val, step)
  index = start_val
  loop do
    break if index > end_val

    yield(index)
    index += step
  end
  (start_val..end_val) # to imitate original functionality
end

step(1, 10, 3) { |value| puts "value = #{value}" }
