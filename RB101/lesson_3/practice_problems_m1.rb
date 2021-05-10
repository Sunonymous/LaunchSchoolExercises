# Practice Problems Medium 1
# 
# 1)
# 10.times { |i| puts "#{' '*i*1}The Flintstones Rock!" }
# 2) Ruby is attempting to call puts on the single expression of
#    adding the string and the integer, which are not coerced
#    implicitly. One could use string interpolation to include
#    the integer, or change the + sign to a comma to make the
#    math result another, separate, argument, though this creates two lines.
# 3)
def factors(number)
  divisor = number
  factors = []
  loop do
    break if divisor <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
# The modulo operator only runs the line if the number is 
# evenly divisible by the divisor.
# The second to last line returns the array factors.
# I guess a while loop is more appropriate, since this code
# may not necessarily have to run.
#
# 4) The operator << mutates the caller, so the primary difference
#    between the two methods is that the method using + would need
#    to be called in an assignment expression, and the other not.
# 5) The method can't reach the limit variable because it's not in scope.
#    Either initialize the limit variable inside the method or pass it in.
# 6) 34
# 7) Yes, the original hash data is altered, because indexed assignment
#    is destructive and mutates its caller.
# 8) puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
#    puts "paper"
#    This was a confusingly-worded question. I understood how to follow the
#    method calls, though the question wording / prompt was strange.
# 9) "no" because foo's param is useless, literally.
