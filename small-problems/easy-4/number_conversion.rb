# Convert a Number to a String
#
DIGITS = %w(0 1 2 3 4 5 6 7 8 9)
def integer_to_string(num)
  num.digits.reverse.
     map! { |digit| DIGITS[digit] }.
     join
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

# I want practice iterating through digits manually, i.e. with divmod

def integer_to_string(num)
  result = ''
  loop do
    quotient, remainder = num.divmod(10)
    result.prepend(DIGITS[remainder])
    break if quotient == 0
  end
  results
end
