require 'time'
# After Midnight Part One
#
# P ------------------------------------------------------------
# Write a method taking an integer argument for minutes and returns
# a 'hh:mm' format of time with the minutes provided acting as
# distance from midnight.
# Rules -> Integer input may be positive or negative, and exceed
#          the absolute value of the number of minutes per day.
#          May not use built-in classes of Date and Time.
# Questions
#          What if more than a day is calculated?
#           Examples indicate that we only display a standard clock.
#          What about single digit minutes or hours?
#           Examples indicate these must be padded with a single 0.
# E ------------------------------------------------------------
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"
# D ------------------------------------------------------------
# This is primarily calculations. No collections are necessary.
# A ------------------------------------------------------------
# Input -> 'minutes_passed'
# Initialize a constant 'MIN_IN_DAY' the number of minutes per day.
# If the absolute value of minutes_passed is greater than MIN_IN_DAY
#   Set minutes_passed to minutes_passed % MIN_IN_DAY
# Create a variable 'hours_passed' and assign it to minutes_passed % 60
# Set minutes_passed to minutes_passed - (hours_passed * 60)
# Create two new variables, 'clock_hours' and 'clock_minutes' at 0
# Add hours_passed to clock_hours
# Add minutes_passed to clock_minutes
# Format clock_hours and clock_minutes with a leading 0 if needed.
# Return a string with clock_hours and clock_minutes interpolated.
# C ------------------------------------------------------------
MIN_IN_DAY = 60 * 24
SEC_IN_MIN = 60
WEEKDAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']

def time_of_day(minutes_passed)
  minutes_passed %= MIN_IN_DAY if minutes_passed.abs >= MIN_IN_DAY
  hours_passed, minutes_passed = minutes_passed.divmod(60)
  clock_hours = (hours_passed >= 0) ? 0 + hours_passed : 24 + hours_passed
  clock_minutes = 0 + minutes_passed
  clock_hours = clock_hours.to_s.rjust(2, '0')
  clock_minutes = clock_minutes.to_s.rjust(2, '0')
  "#{clock_hours}:#{clock_minutes}"
end

def time_of_day_with_date(minutes_passed)
  date = Time.new(0, 1, 1, 0, 0, 0)
  date += minutes_passed * SEC_IN_MIN
  format('%02d:%02d', date.hour, date.min)
end

def time_of_day_with_weekday(minutes_passed)
  date = Time.new(0, 1, 2, 0, 0, 0)
  date += minutes_passed * SEC_IN_MIN
  "#{WEEKDAYS[date.wday]} #{format('%02d:%02d', date.hour, date.min)}"
end

puts time_of_day_with_weekday(0) == "00:00"
puts time_of_day_with_weekday(-3) == "23:57"
puts time_of_day_with_weekday(35) == "00:35"
puts time_of_day_with_weekday(-1437) == "00:03"
puts time_of_day_with_weekday(3000) == "02:00"
puts time_of_day_with_weekday(-4231) == "01:29"
puts time_of_day_with_weekday(800) == "13:20"
