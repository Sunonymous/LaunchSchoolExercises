=begin
# unpredictable weather part one
sun = ['visible', 'hidden'].sample
if sun == 'visible'
	puts "The sun is super bright!"
end

# unpredictable weather part two
unless sun == 'visible'
	puts "The clouds are blocking the sun!"
end

# unpredictable weather part three
puts "The sun is super bright!" if sun == 'visible'
puts "The clouds are blocking the sun!" unless sun == 'visible'
=end


# true or false
boolean = [true, false].sample
#puts boolean ? "I'm true!" : "I'm false..."

# # truthy number
# number = 7
# if number
#   puts "My favorite number is #{number}."
# else
#   puts "I don't have a favorite number."
# end
# # should print 'My favorite number is 7.'


=begin
# stoplight part one
stoplight = ['green', 'yellow', 'red'].sample
case stoplight
	when "green" then puts "Go"
	when "yellow" then puts "Slow down!"
	when "red" then puts "Stop!"
end

if stoplight == 'green'
  puts 'Go!'
elsif stoplight == 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end
=end


# sleep alert
status = ['awake', 'tired'].sample
#recommendation = if status == "awake" then "Be productive!" else "Go to sleep!" end
recommendation = if status == 'awake'
								   'Be productive!'
								 else
								   'Go to Sleep!'
								 end
#puts recommendation


=begin
# cool numbers
number = rand(10)
if number == 5
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end
# this is obviously to illustrate the importance of watching for = vs ==
=end



# stoplight part three
# oh, I actually already used this for my original stoplight example
# their formatting is prettier, so I will practice doing that
stoplight = ['green', 'yellow', 'red'].sample
case stoplight
	when "green"  then puts "Go"
	when "yellow" then puts "Slow down!"
	else               puts "Stop!"
end
# I wonder where I could note to keep an eye on vertical alignement or formatting of code... maybe it comes with time.