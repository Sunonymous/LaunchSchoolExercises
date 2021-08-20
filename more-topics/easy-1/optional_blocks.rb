# Optional Blocks

# Method needs to take an optional block. Ternary operator seems appropriate.
# If block is present, yield; if not, return string.

def compute
  block_given? ? yield : 'Does not compute.'
end

# Further Exploration
def compute_fe(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

# Test Cases
p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further Cases
p compute_fe(42) { |num| num**num } == 42**42
p compute_fe('dog') { |word| word + word.reverse + word } == 'doggoddog'
p compute_fe([1, 2, 3]) { |arr| arr.inject(&:+) } == 6
