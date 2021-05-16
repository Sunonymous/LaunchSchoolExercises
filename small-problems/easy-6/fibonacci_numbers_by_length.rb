# Fibonacci Number Location by Length
#
# Problem     |---------------------------------------------------------------|
#             |Write a method that returns the index of the first number in the
#             |Fibonacci sequence containing the specified number of digits.
#       Input |Integer number of digits, 'digits'
#       Output|Integer index of the first Fibonacci number with that many digits.
#       Edges |Invalid (< 2 or non-integer) input.
#       Rules |Input will not be less than two.
#             |
#   Questions |
# Example     |---------------------------------------------------------------|
# find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847
# Data        |---------------------------------------------------------------|
#             |An array will be used to hold the Fibonacci numbers.
# Algorithm   |---------------------------------------------------------------|
#             |Create an array to generate the Fibonacci numbers.
#             |Begin a loop which breaks when the length of the last number in
#             |  the array is equal to the digits specified.
#             |  If not, then append the number which is the sum of the last
#             |  two numbers in the sequence.
#             |Return the index of the last number when the conditions are met.
# Code________|_______________________________________________________________|
#
def find_fibonacci_index_by_length(digits)
  fib_numbers = [1, 1]
  loop do
    break fib_numbers.length if fib_numbers.last.to_s.length >= digits
    fib_numbers.push (fib_numbers[-2] + fib_numbers[-1])
  end
end

puts find_fibonacci_index_by_length(2) == 7
puts find_fibonacci_index_by_length(3) == 12
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
