# Each Consecutive Part 2

# Similar enough to the last to not need to rewrite the whole song and dance.
def each_cons(array, group)
  index = 0
  while index < array.size - (group - 1)
    values = []
    group_idx = 0
    until group_idx >= group
      values.push(array[index + group_idx])
      group_idx += 1
    end
    yield(*values)
    index += 1
  end
  nil
end

# Wow. Their solution is so much simpler than mine. It should be reformatted.
def each_cons(array, group)
  # The simplest refactoring to be done is the fact that they splatted a slice
  #   of the array.
  index = 0
  while index < array.size - (group - 1)
    yield(*array[index, group])
    index += 1
  end
  nil
end
# So much cleaner! Hard to believe.

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}
