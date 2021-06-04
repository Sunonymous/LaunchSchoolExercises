# Egyptian Fractions
#
# Problem     |---------------------------------------------------------------|
#             |Given a rational number, return a list of denominators used to 
#             |express the number as an egyptian fraction.
#             |Write another method to reverse this process using that array.
#       Input |A rational number
#       Output|An array of denominators in an equivalent Egyptian fraction
#       Edges |Invalid fractions (ignored)
#             |
#       Rules |Egyptian Fractions are sums of unique unit fractions
#             |Can be written in an infinite number of ways.
#             |Use the Rational class.
#             |
#   Questions |Can I go home now??
#             |
# Example     |---------------------------------------------------------------|
# (See Bottom of Code)
# Data        |---------------------------------------------------------------|
#             |We're using arrays here. Imagination!
# Algorithm   |---------------------------------------------------------------|
#             |Greedy algorithm.
#             |Given a rational number, create an array to store the denominators.
#             |Until the numerator becomes 0
#             |  Store the ceiling of numerator divided by denominator and append
#             |    it to the denominator array
#             |  Set the numerator to that ceiling value * numerator - denominator
#             |  Set denominator to denominator * ceiling value
#             |Return denominators array
# Code________|_______________________________________________________________|
#
def egyptian(rat_num)
  denominators = []
  num = rat_num.numerator.to_f
  den = rat_num.denominator.to_f
  while num != 0
    new_denom = (den / num).ceil
    denominators.push(new_denom)
    num = (new_denom * num) - den 
    den = den * new_denom
  end
  denominators
end

def egyptian(rat_num)
  denominators = []
  to_add = 1
  until rat_num == 0
    if Rational(1, to_add) <= rat_num
      denominators.push(to_add) 
      rat_num -= Rational(1, to_add)
    end
    to_add += 1
  end
  denominators
end

def unegyptian(denominators)
  result = Rational(0)
  denominators.each { |den| result += Rational(1, den) }
  result
end

# p egyptian(Rational(4, 17))
p egyptian(Rational(2, 1))    == [1, 2, 3, 6]
p egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

puts unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
puts unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
puts unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
puts unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
puts unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
puts unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
puts unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
puts unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
