# Fibonacci Numbers (Recursion)
#
# Problem     |---------------------------------------------------------------|
#             |Write a recursive function to calculate the nth Fibonacci number
#             |  when provided n as an integer.
#       Input |An integer, n
#       Output|The fibonacci number at sequence n
#       Edges |0 or negative numbers, non-integer input.
#       Rules |The Fibonacci number at indexes 1 and 2 are 1.
#             |Formula: F(n) = F(n - 1) + F(n - 2) where n > 2
#   Questions |
# Example     |---------------------------------------------------------------|
# fibonacci(1) == 1
# fibonacci(2) == 1
# fibonacci(3) == 2
# fibonacci(4) == 3
# fibonacci(5) == 5
# fibonacci(12) == 144
# fibonacci(20) == 6765
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |Start the function on the number provided.
#             |If n is 1 or 2, return 1
#             |Otherwise, return the sum of calling the function of n - 1 and
#             |  again on n - 2.
# Code________|_______________________________________________________________|
#
def fibonacci(num)
  return 1 if num <= 2
  fibonacci(num - 1) + fibonacci(num - 2)
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765
