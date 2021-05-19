# Grocery List
#
# Problem     |---------------------------------------------------------------|
#             |Given an array of subarrays, each containing an item and its
#             |quantity, return a flat array consisting of individual items
#             |matching the count suggested in the input subarray.
#       Input |Nested array of [[item, count] [item, count]]
#       Output|Flat array of [item1, item2] where each item appears as many times
#             |  as its count suggests.
#       Edges |Examples suggests no input validation is necessary.
#             |Potential edge of items with count of 0.
#       Rules |Each item will appear in the returned array as many times as the
#             |  count in the input subarray suggests.
#   Questions |
# Example     |---------------------------------------------------------------|
# buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
# ["apples", "apples", "apples", "orange", "bananas","bananas"]
# Data        |---------------------------------------------------------------|
#             |Arraaaaaaaays hooray arrays
# Algorithm   |---------------------------------------------------------------|
#             |Create an empty array, 'results'
#             |Iterate through the outer array
#             |Using the second item in the inner arrays as a count, add the 
#             |  first inner item to results count number of times.
#             |Return results
# Code________|_______________________________________________________________|
#
def buy_fruit(list)
  results = []
  list.each do |subarray|
    subarray[1].times { results << subarray[0] }
  end
  results
end

# I will write their solution as well, so that I can practice being a little more
# explicit in naming...

def buy_fruit(list)
  results = []
  list.each do |fruit, quantity|
    quantity.times { results << fruit }
  end
  results
end
# this is interesting, as it suggests block arguments can separate / split array values

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]
