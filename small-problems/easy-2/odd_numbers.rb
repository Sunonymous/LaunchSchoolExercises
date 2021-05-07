# Odd Numbers
#
# Problem
#   Print odd numbers in set 1 - 99, including 99.
# Example
#   I'm not diving too deep into this one...
# Data Structure
#   N/A
# Algorithm
#   Use a range and puts.
# Code
# original
(1..99).step(2).each { |num| puts num }
# fe
array = (1..99).to_a
array.select { |n| n.odd? }.each { |num| puts num }
