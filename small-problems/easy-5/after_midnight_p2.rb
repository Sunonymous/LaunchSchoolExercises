# After Midnight Part Two
#
# Problem   |------------------------------------------------------------|
#            Input is a clock string as 'hh:mm' in military time.
#            Write two methods which take the input string and calculate
#            the number of minutes before and after midnight, respectively.
#            Output is the integer number of minutes different from 00:00.
#   Rules -> Input is a formatted string. No validation needed.
#            Output is an integer between 0 and 1439.
# Question ->How do the methods differ in effect?
#           | The before midnight needs to calculate the deltas from 60 & 23.
#           |What is the range of acceptable clock strings?
#           | The examples suggest they will go from 00:00 to 24:00.
# Example   |------------------------------------------------------------|
# after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0
# Data      |------------------------------------------------------------|
#           |Array to handle the split input.
# Algorithm |------------------------------------------------------------|
#           |Input of 'str'
#           |Split str by the delimiter of ':' into an array.
#           |Calculate deltas using 00:00 and hours / minutes from the after
#           | midnight function and 23:60 and hours / minutes for before.
#           |Multiply the delta hours by 60 and add the delta minutes.
#           |Return this result.
# Code______|____________________________________________________________|
#
HOURS_IN_DAY = 24
MINUTES_IN_HOUR = 60

def after_midnight(clock_str)
  delta_hour, delta_minute = clock_str.split(':').map(&:to_i)
  delta_hour = 0 if delta_hour == 24 # edge
  delta_minute + (delta_hour * MINUTES_IN_HOUR)
end

def before_midnight(clock_str)
  clock_hour, clock_minute = clock_str.split(':').map(&:to_i)
  clock_hour = 0 if clock_hour == 24 # edge
  delta_hour = clock_hour > 0 ? (23 - clock_hour) : 0
  delta_minute = clock_minute > 0 ? (60 - clock_minute) : 0
  delta_minute + (delta_hour * MINUTES_IN_HOUR)
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
