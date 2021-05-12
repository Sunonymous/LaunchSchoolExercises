# Convert a String to a Signed Integer
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

def string_to_signed_integer_mine(string) # renamed for exercise
  chars = string.chars.reverse
  positive = (chars.last == '-') ? false : true
  chars.pop if !DIGITS.include?(chars.last)
  num = 0
  chars.each_with_index do |digit, idx|
    num += (DIGITS.index(digit) * 10**idx)
  end
  num *= -1 if !positive
  num
end

# refactoring LS code for FE
def string_to_signed_integer(string)
  digits = string.chars
  sign = digits.shift if !DIGITS.include?(digits[0])
  string = digits.join
  case sign
  when '-' then -string_to_integer(string)
  else          string_to_integer(string)
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
