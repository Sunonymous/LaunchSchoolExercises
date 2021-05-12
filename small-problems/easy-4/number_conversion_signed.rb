# Convert a Signed Number to a String
#

DIGITS = %w(0 1 2 3 4 5 6 7 8 9)
def integer_to_string(num)
  num.digits.reverse.
     map! { |digit| DIGITS[digit] }.
     join
end

def signed_integer_to_string(num)
  negative = num < 0
  num *= -1 if negative
  string = integer_to_string(num)
  return string if string == '0'
  sign = negative ? '-' : '+'
  string.prepend(sign)
end

def signed_integer_to_string(num)
  sign = case num <=> 0
         when -1 then "-"
         when +1 then "+"
         else         ""
         end
  num *= -1 if sign == '-'
  "#{sign}#{integer_to_string(num)}"
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
