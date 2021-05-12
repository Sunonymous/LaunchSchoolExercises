# String Conversion
#
# I accidentally overrode this file while working on the next exercise... oops.
#
DIGITS = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
def string_to_integer(string)
  chars = string.chars.reverse
  num = 0
  chars.each_with_index do |digit, idx|
    num += (DIGITS.index(digit) * 10**idx)
  end
  num
end

def hexadecimal_to_integer(hexnum)
  chars = hexnum.chars.reverse
  num = 0
  chars.each_with_index do |digit, idx|
    num += (DIGITS.index(digit.downcase) * 16**idx)
  end
  num
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
puts hexadecimal_to_integer('4D9f') == 19871
