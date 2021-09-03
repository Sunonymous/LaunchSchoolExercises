# frozen_string_literal: true

# Meetups

# Architecture
# Meetup is a class which takes a year and a month into its constructor.
# Meetup has an instance method Meetup#day, which takes a weekday and an ordinal
#   qualifier, e.g. first, second, third, fourth, fifth, last, or teenth.
#   It returns a 'Date' object containing the actual date of the requested day.
# No input validation appears necessary. #trusttheuser!

# P
#   Given a year, month, weekday, and ordinal placement, return a Date object
#     containing the exact date for the day requested.
#   Month and year will be given as integers.
#   Case is insensitive for weekday and ordinal qualifier.
#   Method should return nil in the case of a day which does not exist.
# examples in test file
# data: classes and... dates?
# A
#   First thing is first, we can create an array to house the various weekdays
#     and qualifiers to check against.
#   Should dig into the Date class to see what methods we have at our disposal.
#   The only unknown factor is the day. We have the year and the month already.
#   Create an array of days which meet the weekday criteria.
#   Loop through the days in the month which are valid for the given option.
#     If the day is the same as the requested weekday, add it to the array.
#   If the array contains a day that is valid for the request, construct a
#     Date object using it along with the year and month. If not, return nil.
# C

require 'date'

class Meetup
  WEEKDAYS = %w[sunday monday tuesday wednesday thursday friday saturday].freeze
  OPTIONS = %w[first second third fourth fifth last teenth].freeze

  def initialize(year, month_num)
    @year = year
    @month = month_num
  end

  def day(weekday, position)
    position = position.downcase
    feb_days = Date.leap?(@year) ? 29 : 28 # adjust for leap year!
    days_in_month = [0, 31, feb_days, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    m_weekdays = []
    1.upto(days_in_month[@month]) do |day|
      m_weekdays << day if valid_weekday?(day, weekday, position)
    end
    result = select_weekday(m_weekdays, position)
    result.nil? ? result : Date.civil(@year, @month, result)
  end

  private

  def valid_weekday?(day, weekday, position)
    date = Date.civil(@year, @month, day)
    case position
    when 'first', 'second', 'third', 'fourth', 'fifth', 'last'
      date.wday == WEEKDAYS.index(weekday.downcase)
    when 'teenth'
      date.wday == WEEKDAYS.index(weekday.downcase) && date.day.between?(13, 19)
    end
  end

  def select_weekday(day_array, position)
    case position
    when 'first'  then day_array.first
    when 'second' then day_array[1]
    when 'third'  then day_array[2]
    when 'fourth' then day_array[3]
    when 'fifth'  then day_array[4]
    when 'teenth' then day_array.first
    when 'last'   then day_array.last
    end
  end
end
