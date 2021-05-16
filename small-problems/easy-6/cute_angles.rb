# Cute Angles
#
# Problem     |---------------------------------------------------------------|
#             |Design a method which accepts a float from 0-360 and returns
#             |the amount of degrees, minutes, and seconds based on that float.
#       Input |Float 'degrees' between 0 and 360
#       Output|Formatted string of 00°00'00"
#       Edges |Input outside of range.
#       Rules |Output must be formatted.
#             |There are 60 seconds in a minute, and 60 minutes in a degree.
#   Questions |
# Example     |---------------------------------------------------------------|
# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# Data        |---------------------------------------------------------------|
#             |No data structures will be used in a permanent manner.
# Algorithm   |---------------------------------------------------------------|
#             |Take the float and determine whether or not it has a decimal.
#             |If so, split the number over the decimal.
#             |If not, RETURN the number in the formatted strings sans '&"
#             |Divide 60 by the decimal remainder of float.
#             |Check if there is another decimal. If so, split the number again.
#             |If no 2nd decimal, insert the minutes into the string and RETURN
#             |Insert the minutes and seconds values into the string and RETURN.
# Code________|_______________________________________________________________|
#
DEGREE = "\xC2\xB0"
MINUTES_IN_DEGREE = 60
SECONDS_IN_MINUTE = 60

def has_decimal?(float)
  float.to_s.include?('.')
end

def split_over_decimal(float)
  whole, part = float.to_s.split('.')
  return whole.to_f, (part.to_f / (10**part.length))
end

def dms(float)
  degrees, minutes = split_over_decimal(float) if has_decimal?(float)
  degrees ||= float
  minutes ||= 0
  minutes *= MINUTES_IN_DEGREE
  minutes, seconds = split_over_decimal(minutes) if has_decimal?(minutes)
  seconds ||= 0
  seconds *= SECONDS_IN_MINUTE
  degrees = degrees.to_i
  "#{degrees}#{DEGREE}#{format('%02d', minutes)}'#{format('%02d', seconds)}\""
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
