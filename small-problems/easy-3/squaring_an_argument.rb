# Squaring an Argument
#
def square(num)
  multiply(num, num)
end

def square_to(num, pow)
  original = num
  new = 1
  pow.times do
    new = multiply(original, new)
  end
  new
end

def alt_square_to(num, pow)
  ([num]*pow).reduce(:*)
end

def multiply(num1, num2)
  num1 * num2
end

puts alt_square_to(5, 3)
