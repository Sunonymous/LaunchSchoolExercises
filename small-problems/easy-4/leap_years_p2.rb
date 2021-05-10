# Leap Years P2
# 
# Same as last exercise, with a branch in calculation.
#
def leap_year_julian?(year)
  year % 4 == 0
end

def leap_year_gregorian?(year)
  (year % 400 == 0) || (year % 4 == 0) && (year % 100 != 0)
end

def leap_year?(year)
  return leap_year_julian?(year) if year < 1752
  leap_year_gregorian?(year)
end

