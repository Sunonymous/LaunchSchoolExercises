# Leap Years (P1)
#
# Problem
#   Given a year greater than 0, return true if it's a leap year or false if not.
#   Input -> Positive Year Integer
#   Output -> true if year is leap year, false if not
# Example
#   2016 => true
#   2015 => false
#   240000 = true
# Data Structure
#   N/A
# Algorithm
#   Year must be evenly divisble by 4 && not 100
#   OR
#   Year must be evenly divisble by 4 && 400
# Code
#
def leap_year?(year)
  by_400_and_100 = (year % 100 == 0) && (year % 400 == 0)
  return (year % 4 == 0) && by_400_and_100 if year % 100 == 0
  (year % 4 == 0) && (year % 100 != 0)
end

def leap_year_2?(year)
  (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0)
end
