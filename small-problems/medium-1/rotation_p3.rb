# Rotation Part 3
#
# Problem     |---------------------------------------------------------------|
#             |Given a number, rotate every digit sequentially so that the
#             |number becomes all well and jumbled.
#       Input |Integer
#       Output|Fully rotated Integer
#       Edges |Leading zeroes are discarded... apparently not an issue.
#             |Input validation doesn't appear to be necessary.
#       Rules |Much achieve maximum rotation of the number!
#   Questions |
#             |Is there a way to validate max rotation?
#             |Is this a real thing??
# Example     |---------------------------------------------------------------|
# max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845
# Data        |---------------------------------------------------------------|
#             |May be sorted into arrays temporarily.
# Algorithm   |---------------------------------------------------------------|
#             |We'll need to call our rotate_rightmost_digits function a series
#             |  of times, incrementing the starting index.
#             |Start with the length of the number and decrement the idx after
#             |  rotating the digits.
#             |Stop when the index has reached one.
#             |Return results.
# Code________|_______________________________________________________________|
#
def rotate_array(arr)
  clone = arr.dup
  clone.push(clone.shift)
end

def rotate_rightmost_digits(num, digits_to_rotate)
  raise ArgumentError.new('You know what you did!') if digits_to_rotate > num.to_s.length
  full = num.to_s.chars
  target = full[-digits_to_rotate]
  full.delete_at(-digits_to_rotate)
  full.push(target).join.to_i
end

def rotate_rightmost_digits(num, digits_to_rotate)
  return num if digits_to_rotate == 1
  digits = num.to_s.chars
  length = digits.size
  before_split = digits[0, length - digits_to_rotate]
  after_split = digits[-digits_to_rotate..]
  (before_split + rotate_array(after_split)).join.to_i
end

def max_rotation(num)
  digits = num.to_s.chars
  len = digits.size
  until len == 1
    num = rotate_rightmost_digits(num, len)
    len -= 1
  end
  num
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
