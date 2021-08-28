# Octal

# Architecture
# Octal is a class, passed a string number into its constructor, which it converts
#   into an octal number. It contains the instance method Octal#to_decimal, which
#   returns the decimal value of the same number.

# P
#   Convert a number given as octal form into decimal form.
#   The number given will be in string form. Invalid input should return 0.
# examples in test cases
# data: class, maybe an array of characters
# A
#   Check and see if the characters given are valid, and it not, set the value
#     to zero for the object.
#   Create a powers array based on the length of the number. Create the array
#     from 0 up to the length of the array, reversed and multiplied by 8.
#   Initialize a results integer at 0.
#   For each character in the octal string with its index, add to the results
#     the number of the character times the value at the same index in powers.
#   Return results.
# C

class Octal
  DIGITS = (0..7).to_a.map(&:to_s)

  def initialize(num_str)
    @val = valid_characters?(num_str) ? num_str : '0'
  end

  def to_decimal
    powers = (0...@val.length).map { |n| 8**n }.reverse
    result = 0
    @val.chars.each_with_index { |num, idx| result += num.to_i * powers[idx] }
    result
  end

  private

  def valid_characters?(str)
    str.each_char { |c| return false unless DIGITS.include?(c) }
    true
  end
end
