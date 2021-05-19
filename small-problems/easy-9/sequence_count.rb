# Sequence Count
#
# Problem     |---------------------------------------------------------------|
#             |Given two integers as arguments, a count and a step, return an
#             |array with count number of elements, starting and incremented by
#             |step.
#       Input |An integer count of elements and integer step.
#       Output|An array of count number of elements changed by step step.
#       Edges |A count of zero should return an empty array.
#       Rules |Returned array will have the same number of elements as the
#             |  count argument.
#             |Each element in the returned array will be incremented or
#             |  decremented by step argument.
#   Questions |
# Example     |---------------------------------------------------------------|
# sequence(5, 1) == [1, 2, 3, 4, 5]
# sequence(4, -7) == [-7, -14, -21, -28]
# sequence(3, 0) == [0, 0, 0]
# sequence(0, 1000000) == []
# Data        |---------------------------------------------------------------|
#             |Arrays will be constructed and returned.
# Algorithm   |---------------------------------------------------------------|
#             |Return an empty array if count is zero.
#             |Create an array to store the results, 'results'.
#             |Create an integer, 'val' at value step to track the value.
#             |Count number of times --
#             |  Add val to results
#             |  Add step to val
#             |Return results
# Code________|_______________________________________________________________|
#
def sequence(count, step)
  results = []
  val = step
  count.times do
    results << val
    val += step
  end
  results
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []
