# How Many?
#
# Problem
#   Input -> Array
#   Output -> Hash
#   Model -> Given an array, add each element to a hash with a default count of 1,
#     incrementing the count if an element is repeated.
# Example
#   vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
#   count_occurrences(vehicles) >> car => 4, truck => 3, SUV => 1, motorcycle => 2
# Data Structure
#   Given an array, the items are sorted into a hash with the elements as keys and their counts as values.
# Algorithm
#   Initialize an empty hash with a default value of zero. Iterate through the elements in the array,
#   adding one to each key value as encountered. Return/print the hash.
# Code
#
def count_occurrences(arr)
  result = Hash.new(0)
  arr.each {|elem| result[elem] += 1}
  result.each_key do |key|
    puts "#{key} => #{result[key]}"
  end
end

