# Divisors

# P
#   Return a list of all divisors of the positive integer argument.
#   Return can be in any sequence desired.
# examples below
# Data: Arrays
# A
#   Iterate from 1 up to num, inclusively, adding each number which divides
#     evenly (using modulo operator) to a results array. Return results.
# C

# Example of bad variable naming
def divisors(num)
  results = []
  (1..num).each do |n|
    results << n if num % n == 0
  end
  results
end

# Brute force algorithm alternatives?

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
