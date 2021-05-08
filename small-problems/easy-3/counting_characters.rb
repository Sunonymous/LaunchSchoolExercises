# Counting Characters
#
# Too simple for PEDAC
#
puts 'Please enter a string:'
print "\n>> "
string = gets.chomp
puts "There are #{string.split.join.length} characters in \"#{string}\". "
