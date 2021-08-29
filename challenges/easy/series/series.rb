# Series

# Architecture
# Series is a class which accepts a string into its constructor. The string should
#   be a series of digits. No input validation is needed at this time.
# Series also has an instance method, Series#slices, which takes an integer argument
#   and returns all possible groupings of consecutive integers of the given length.

# P
#   (This was originally misunderstood to be consecutive integers inside of
#     consecutive digits within the given string. This is basically substrings.)
#   Return all possible substrings of a given length `len` within an string.
#   `len` must be the same as the length of the string or less.
#     Raise an exception if this is not the case.
# examples in test cases
# data: class and arrays
# A
#   Two variables are needed for the iteration here. The length of the substrings
#     and the index of the starting position.
#   We may only iterate up until the character whose distance from the end of the
#     string must not exceed the length of the substring.
#   This means we should iterate from 0 to length of string - `len`, inclusively.
#   Create a results array as empty.
#   For each iteration, append a slice of the string from idx with a length of 2
#     to the results array. Before appending, convert the substring into an array
#     of integer digits.
#   Return results.
# C

class Series
  def initialize(str)
    @digits = str
  end

  def slices(num)
    err = '<slice length> must not exceed digit string length!'
    raise ArgumentError, err if num > @digits.length
    results = []
    idx = 0
    while idx <= @digits.length - num
      results << @digits[idx, num].chars.map(&:to_i)
      idx += 1
    end
    results
  end
end
