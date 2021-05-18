# fizzbuzz
#
# Problem     |---------------------------------------------------------------|
#             |Given a starting number and an ending number, print out each of
#             |the numbers, except if the number is divisible by 3, in which case
#             |print "Fizz", or divisible by 5, in which case "Buzz", and "FizzBuzz"
#             |if divisible by both.
#       Input |A start integer and an end integer
#       Output|Printing to the console.
#       Edges |Non-integer input values
#             |End lower than start input value.
#       Rules |Print each number in the given sequence, unless it meets a condition.
#             |If the number is divisible by three, print "Fizz"
#             |If divisible by five, print "Buzz"
#             |If divisible by both three and five, print "FizzBuzz"
#   Questions |
# Example     |---------------------------------------------------------------|
#fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |Create a one-line method to verify conditions of divisibility.
#             |Create a range for iteration, starting at first input, ending at 2nd.
#             |Create an empty string, 'result'
#             |On each iteration, if divisible by 3, append "Fizz" to result
#             |If divisible by 5, append "Buzz" to result
#             |If result is empty, set it to the cast of the current integer to string.
#             |Print result
# Code________|_______________________________________________________________|
#
def fizzbuzz(start_num, end_num)
  values = []
  (start_num..end_num).each do |num|
    result = ''
    result << 'Fizz' if num % 3 == 0
    result << 'Buzz' if num % 5 == 0
    result = num.to_s if result.empty?
    values << result
  end
  puts values.join(', ')
end

fizzbuzz(1, 15)
