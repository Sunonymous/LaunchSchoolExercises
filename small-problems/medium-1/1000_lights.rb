# 1000 Lights
#
# Problem     |---------------------------------------------------------------|
#             |Given an integer, write a method which toggles a boolean between
#             |on and off, repeatedly increasing the spaces in-between which
#             |values are toggled (this is super vague).
#       Input |An integer n
#       Output|An array display which values from 1 to n are true.
#       Edges |Negative integer input.
#       Rules |The input integer defines the number of elements in the array.
#             |The input integer defines the number of times to pass through it
#             |On each pass, different values are toggled
#             |On the first pass, all values are toggled on.
#             |On the second pass, all values are toggled in steps of 2.
#             |On the third pass, all values are toggled in steps of 3.
#             |Etc. etc.
#   Questions |
#             |
# Example     |---------------------------------------------------------------|
# puts  lightbank(5) == [1, 4]
# puts lightbank(10) == [1, 4, 9]
# Data        |---------------------------------------------------------------|
#             |Arrrrrrrrrrrrrrgh, I'll be using an array.
# Algorithm   |---------------------------------------------------------------|
#             |Create an array equal to integer n false values.
#             |Start a loop from of n times.
#             |Create an index array of indexes from 0 to n - 1, with a step of
#             |  the outer loop index.
#             |Use the index array to toggle the values at the particular indexes.
#             |Return the value array.
# Code________|_______________________________________________________________|
#
def create_lightbank(count)
  [nil].concat([false] * count)
end

def toggle_lights(lights, positions)
  positions.each do |idx|
    lights[idx] = !lights[idx]
  end
end

def find_lights_on(lights)
  indexes = []
  lights.each_with_index { |val, idx| indexes << idx if val }
  indexes
end

def lightbank(num_lights)
  lightbank = create_lightbank(num_lights)
  step = 0
  num_lights.times do
    step += 1
    indexes = (step..num_lights).step(step).to_a
    toggle_lights(lightbank, indexes)
  end
  find_lights_on(lightbank)
end

def fancy_print_on(lights_on, lights_off)
  are_on = 'lights '
  on_dup = lights_on.dup
  last_on = on_dup.pop
  are_on << on_dup.join(', ') << ' and ' << last_on.to_s << ' are on; '
  are_off = ''
  off_dup = lights_off.dup
  last_off = off_dup.pop
  are_off << off_dup.join(', ') << ' and ' << last_off.to_s << ' are off'
  are_on + are_off
end

puts lightbank(5) == [1, 4]
puts lightbank(10) == [1, 4, 9]
#p lightbank(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
