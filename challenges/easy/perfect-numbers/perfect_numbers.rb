# Architecture
# PerfectNumber is a class which contains a class method PerfectNumber#classify,
#   which accepts an integer argument and returns a string classification.

# P
#   Classify a number as either abundant, perfect, or deficient, based on the
#     sum of its divisors. If the sum is less than the number, it is deficient.
#     If the sum matches the number, it is perfect, and if it exceeds the number,
#     it is abundant.
#   Negative numbers should result in an error.
#   Prime numbers are always deficient.
# examples in test cases
# data: class
# A
#   A helper method to obtain the divisors should be written. Iterate from 1 to
#   one less than the number and add each number to a results array which evenly
#   divides the original number.
#   Obtain the divisors of the number. If the sum matches the number, return
#     'perfect'. If less than, 'deficient', and more than, 'abundant'.
# C

class PerfectNumber
  def self.divisors(num)
    results = []
    1.upto(num / 2).each do |x|
      results << x if num % x == 0
    end
    results
  end

  def self.classify(num)
    raise StandardError, '<num> must be a positive integer.' unless num.positive?
    div_sum = PerfectNumber.divisors(num).sum
    return 'perfect' if div_sum == num
    div_sum > num ? 'abundant' : 'deficient'
  end
end
