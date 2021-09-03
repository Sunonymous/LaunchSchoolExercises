# Clock

# Architecture
# Clock is a class with a class method Clock::at(time), which creates an instance
#   of the clock class at the given time (which may be passed either an hour and/or
#   an hour and the minutes.
# Clock class has implemented the #+ method to add minutes, the #- method to
#   subtract minutes, and the #== method to verify time equality.
# Clock also makes use of the Clock#to_s overridden method to return a simple
#   string interpolation of the hours and minutes around a colon.

# P
#   1
# examples in test file
# data: class
# A
#   The most challenging part of this exercise is the wrapping around 24 hours
#     when given excessive hours or negative time. The equal method should just
#     verify if both objects have the same minutes and hours.
#   Throughout this process some testing was done to verify that this would work.
#   The basic process of adding minutes to the clock was to first get the deltas,
#     which involves dividing the minutes by sixty (hour delta), and then using
#     the modulo operator to get the remainder of the division by 60 (min delta).
#   After you have those, you may add to the hours the result of modulo of the
#     hours delta and 24, and the modulo of the minutes delta and 60.
#   There was an annoying error that was appearing because originally the result
#     of the addition method was not returning a new clock object. The error
#     resulted due to the way the tests were written. This slightly altered the
#     way the method needed to be written.
#   Subtraction is similar but a bit trickier. We calculate the deltas in the
#     same way, however, we must increment the hour delta by one if the minutes
#     subtracted take the clock minutes an hour back (ie. below zero).
# C

class Clock
  attr_reader :hour, :minutes

  def initialize(hour, minutes = 0)
    @hour = hour
    @minutes = minutes
  end

  def to_s
    @hour = 0 if @hour == 24
    hr  = format('%02d', @hour)
    min = format('%02d', @minutes)
    "#{hr}:#{min}"
  end

  # rubocop:disable Naming/BinaryOperatorParameterName
  def +(min)
    hr_delta = min / 60
    mn_delta = min % 60
    hour    = hr_delta.positive? ? wrap_around_24(hr_delta) : @hour
    minutes = mn_delta.positive? ? wrap_around_60(mn_delta) : @minutes
    Clock.new(hour, minutes)
  end

  def -(min)
    hr_delta = min / 60
    mn_delta = min % 60
    hr_delta += 1 if (@minutes - mn_delta).negative?
    hr    = hr_delta.positive? ? wrap_around_24(-hr_delta) : @hour
    min   = mn_delta.positive? ? wrap_around_60(-mn_delta) : @minutes
    Clock.new(hr, min)
  end
  # rubocop:enable Naming/BinaryOperatorParameterName

  def ==(other)
    hour == other.hour && minutes == other.minutes
  end

  def self.at(hour, minutes = 0)
    Clock.new(hour, minutes)
  end

  private

  # rubocop:disable Naming/VariableNumber
  def wrap_around_24(delta)
    (@hour + delta) % 24
  end

  def wrap_around_60(delta)
    (@minutes + delta) % 60
  end
  # rubocop:enable Naming/VariableNumber
end

puts Clock.new(10) - 90
