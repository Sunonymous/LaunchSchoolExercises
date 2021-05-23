# Fibonnaci Numbers (procedural)
#
# Problem     |---------------------------------------------------------------|
#             |Write a fibonnaci method which calculates procedurally, i.e.
#             |  without recursion.
#       Input |An integer, n, of sequence in the Fibonnaci numbers
#       Output|The fibonnaci number at sequence n
#       Edges |Negative input, 0 input, or non-integer
#       Rules |May not calculate the answer recursively.
#             |
#   Questions |
# Example     |---------------------------------------------------------------|
# fibonacci(20) == 6765
# fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |Start the function.
#             |Create an variable, 'index' and set it to 3.
#             |Create two variables, 'prev_num' and 'current_num', and set them
#             |  both to 1.
#             |Until index is equal to n, set prev_num to current_num and set
#             |  current_num to the sum of prev_num and current_num.
#             |A temporary variable may be necessary.
#             |Return current_num.
# Code________|_______________________________________________________________|
#
def fibonacci(num)
  index = 2
  prev_num = 1
  current_num = 1
  until index == num
    temp = current_num
    prev_num, current_num = current_num, prev_num + current_num
    index += 1
  end
  current_num
end

def fibonacci_last(num)
  fibonacci(num).to_s.chars.last.to_i
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
# puts fibonacci(100_001) # => 4202692702.....8285979669707537501
fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4
