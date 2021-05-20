# Rotation Part 2
#
# Problem     |---------------------------------------------------------------|
#             |Given a integer and a number of digits to rotate, rotate the number
#             |of digits specified.
#       Input |A number, and a number of digits to rotate.
#       Output|An integer with rotated digits
#       Edges |Digits more than length of number.
#             |Negative digits (ignore).
#       Rules |Move the digit at position 'digits' to the end of the number.
#             |Digits position is counted from the right.
#             |Digits of 1 returns the same number as the original.
#             |
#   Questions |
# Example     |---------------------------------------------------------------|
# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917
# Data        |---------------------------------------------------------------|
#             |May be sorted into arrays temporarily.
# Algorithm   |---------------------------------------------------------------|
#             |Cast the integer to a string and parse it into an array of chars
#             |Grab the character to rotate based on the digits parameter, and
#             |  store it into a variable before deleting it at that index.
#             |Append the stored digit into the array and return a joined and
#             |  casted version of it.
#             |ALTERNATIVELY, if we are to make use of our previous function,
#             |  we'll just need to use the function on a sub-array starting
#             |  from our particular digit and append the result to the first
#             |  section of the original number.
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
  before_split = digits[0, length - (digits_to_rotate)]
  after_split = digits[-digits_to_rotate..]
  (before_split + rotate_array(after_split)).join.to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
