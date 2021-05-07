# When Will I Retire?
#
# Problem
#   Given a user's age and desired retirement age, display the current year,
#     the year of retirement, and the number of years left to retirement.
#   Input -> Age, R-Age
#   Output -> Current year, distance to retirement in year and amount of years.
# Example
#   Input -> Age 30, R-Age 70 >> "Retire in 2056, forty years left."
# Data Structure
#   N/A, just a calculation
# Algorithm
#   Use the Time class to get the current date.
#   Subtract age from r-age to get the distance, and add the distance to current year.
# Code
#
def retirement_age
  print "How old are you at this time?\n>> "
  age = nil
  loop do
    age = gets.chomp.to_i
    if age < 0
      print "You've entered an implausible age. Please try again.\n>> "
      next
    else
      break
    end
  end
  print "At what age would you like to retire?\n>> "
  retirement_age = nil
  loop do
    retirement_age = gets.chomp.to_i
    if retirement_age < age
      puts "I'm sorry, time tends not to go in this direction."
      print "Please tell me a time in the future.\n>> "
      next
    elsif retirement_age == age
      puts "It seems you are ready! That's hardly a calculation to make..."
      print "How about you tell me a time a little further off? Just for fun?\n>> "
      next
    else
      break
    end
  end
  current_year = Time.now.year
  distance_to_retirement = retirement_age - age
  retirement_year = current_year + distance_to_retirement
  puts "The year is #{current_year}. You are looking to retire in the year #{retirement_year}."
  puts "That gives you a waiting time of only #{distance_to_retirement} years."
  puts "You can do it! The manual says so!"
end

retirement_age

