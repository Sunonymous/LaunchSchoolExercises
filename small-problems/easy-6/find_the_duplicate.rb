# Find the Duplicate
#
# Problem     |---------------------------------------------------------------|
#             |Given an unordered array, return the value which occurs twice.
#       Input |Unordered array of numbers with only a single element twice.
#       Output|The element which occurs twice.
#       Edges |
#       Rules |Elements in input array are unordered, and only one occurs more
#             |  than a single time.
#             |Every value except one appears only once.
#   Questions |Will all elements be of the same type? Apparently, yes.
#             |
# Example     |---------------------------------------------------------------|
# find_dup([1, 5, 3, 1]) == 1
# find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          # 38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          # 14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          # 78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          # 89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          # 41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          # 55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          # 85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          # 40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          # 7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
# Data        |---------------------------------------------------------------|
#             |This uses arrays for input and the algorithm.
# Algorithm   |---------------------------------------------------------------|
#             |Create an empty array, seeker.
#             |Iterate through the input array
#             |  if the current element is not in the seeker array, push it in.
#             |  if the current element is in the seeker array, return it.
# Code________|_______________________________________________________________|
#
def find_dup(arr)
  seeker = []
  arr.each do |elem|
    return elem unless !seeker.include?(elem)
    seeker.push elem
  end
end

# much cleaner solution!
def find_dup(arr)
  arr.find { |elem| arr.count(elem) == 2 }
end

puts find_dup([1, 5, 3, 1]) == 1
puts find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
