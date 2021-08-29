# Sum of Multiples

# Architecture
# SumOfMultiples is a class which has a class method SumOfMultiples#to, and an
#   instance method SumOfMultiples#to. They both do ultimately the same thing,
#   though the instance method will make use of a separate criteria than the
#   class method, which will use the default criteria.
# This could be accomplished in multiple ways. It could be done using the
#   private class instance method like we saw in the perfect numbers bit.
#   It could be done, perhaps, using default arguments.
# Here's the solution, then: the class method will instantiate an object which
#   initializes using the default value of 3 and 5 for the multiples.
# The constructor for the objects of SumOfMultiples will accept multiple numbers
#   supplied as multiples to check against.

# P
#   Find the sum of the multiples of a set of numbers, up to and not including a
#     given number.
#   If a set of multiples is not provided, use 3 and 5.
# examples in test cases
# data: class and arrays
# A
#   Create an empty results array.
#   Start a loop over 1 to ending number - 1. For each number, add it to the
#     results array if any of the multiples divide evenly into it.
#   Return the sum of the results array.
# C

class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples.empty? ? [3, 5] : multiples
  end

  def to(num)
    results = []
    (1...num).each do |check|
      results << check if @multiples.any? { |mult| check % mult == 0 }
    end
    results.sum
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end
end
