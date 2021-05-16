# Does My List Include This?
#
# Problem     |---------------------------------------------------------------|
#             |Given an array and a search value, return true or false based on
#             |  whether or not the search value is within the array.
#       Input |An array and a value to search within the array for.
#       Output|true or false, depending on the presence of the search value
#       Edges |
#       Rules |May NOT use Array#include? method.
#             |
#   Questions |
# Example     |---------------------------------------------------------------|
# include?([1,2,3,4,5], 3) == true
# include?([1,2,3,4,5], 6) == false
# include?([], 3) == false
# include?([nil], nil) == true
# include?([], nil) == false
# Data        |---------------------------------------------------------------|
#             |Arrays are used here. Imagine that.
# Algorithm   |---------------------------------------------------------------|
#             |Using the find function did not work, because nil is a potential
#             |  value! Oops.
#             |Iterate through each value in input array.
#             |  If value is search value, return true.
#             |Return false.
# Code________|_______________________________________________________________|
#
def include?(arr, val)
  arr.each do |elem|
    return true if elem == val
  end
  false
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false
