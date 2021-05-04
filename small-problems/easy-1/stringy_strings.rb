# Stringy Strings
#
# Problem
#   Input -> Positive Integer
#   Output -> String of Length of Input
#   Edge: 0
#   Model -> Create an enumerator of a repeating pattern to build an Array
#     of the length of input, to be joined into a string and returned.
# Examples
#   stringy(6) -> "101010"
#   stringy(9) -> "101010101"
# Data Structure
#   Int -> Array -> String
# Algorithm
#   Create an enumerator of a repeating pattern of ['1', '0']. Build an
#   array using this of length of input, and join it into a single string.
# Code
#
def stringy(int)
  bin = ['1', '0'].cycle
  result = []
  loop do
    break if result.size >= int
    result << bin.next
  end
  result.join
end

def stringy_fe(int, start=1)
  raise ArgumentError.new "The string may only start with 0 or 1." if (start != 0 && start != 1)
  lead_zero = (start == 0)
  bin = (lead_zero ? ['0', '1'].cycle : ['1', '0'].cycle)
  result = []
  loop do
    break if result.size >= int
    result << bin.next
  end
  result.join
end

