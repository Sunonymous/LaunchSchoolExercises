# Unlucky Days
#
# Problem     |---------------------------------------------------------------|
#             |Given a year after 1752, return the number of days in that year
#             |that are Friday and the thirteenth of the month.
#       Input |An integer year after 1752.
#       Output|An integer number of days which are Friday the 13th.
#       Edges |
#       Rules |
#             |
#   Questions |
# Example     |---------------------------------------------------------------|
# friday_13th(2015) == 3
# friday_13th(1986) == 1
# friday_13th(2019) == 2
# Data        |---------------------------------------------------------------|
#             |Probably going to be sorting through an array here...
# Algorithm   |---------------------------------------------------------------|
#             |Create a new variable, total, at 0.
#             |Create a new time instance on Jan. 1 of the given year.
#             |While the year is the same, continue to add the number of seconds
#             |  in a day to the time, checking each time if the day is friday 
#             |  the 13th, in which case, add 1 to total.
#             |Return total.
# Code________|_______________________________________________________________|
#
require 'date'
SECONDS_IN_DAY = 60 * 60 * 24

def friday_13th(year)
  time = Time.new(year)
  total = 0
  until time.year == year + 1
    total += 1 if time.friday? && time.day == 13
    time += SECONDS_IN_DAY
  end
  total
end

# This is probably one of the most inefficient things I've written!
# Wow. Better read up on the date class.

def five_fridays(year)
  # Maybe the approach is more suitable here.
  time = Date.new(year)
  fridays = Hash.new(0)
  until time.year == year + 1
    fridays[time.month] += 1 if time.friday?
    time += 1
  end
  p fridays.select { |_, val| val >= 5 }
  fridays.select { |_, val| val >= 5 }.size
end

puts friday_13th(2021)
puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2
puts five_fridays(2021)
