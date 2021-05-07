# Greeting a User
#
# Problem
#   Greet the user. If the user ends their name with an exclamation point, use all caps.
#   Input -> name
#   Output -> Greeting, in all caps if name ends in !
#   Edge -> Question mark?
# Example
#   Input -> Bob >> "Hey Bob."
#   Input -> Bob! >> "HEY BOB!"
# Data Structure
#   N/A, /not even/ a calculation
# Algorithm
#   Use the #end_with? method on a string to determine if it ends in an exclamation point.
# Code
#
def greet_user
  print "Hello. Could you tell me your name, please?\n>> "
  name = gets.chomp
  if name.end_with?("!")
    puts "OH MY GOODNESS, HELLO #{name.upcase.chop}! FINALLY, SOMEONE WHO UNDERSTANDS MY LOVE FOR SCREAMING!"
  elsif name.end_with?("...")
    puts "Erm... are you sure? Most don't usually pause! I'm suspicious of you, #{name[0...-3]}! Hello, nonetheless."
  elsif name.end_with?("?")
    puts "I hope you're not expecting me to answer this. I'll say yes by default. Hello, Confused--erm, I mean #{name.chop}."
  else
    puts "Greetings to you, #{name}."
  end
end

greet_user

