# String Conversion
#
DIGITS = %w(0 1 2 3 4 5 6 7 8 9)
def string_to_integer(string)
  chars = string.chars.reverse
  num = 0
  multiplier = 1
  chars.each do |digit|
    num += (DIGITS.index(digit) * multiplier)
    multiplier *= 10
  end
  num
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
