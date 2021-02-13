# Snippet 1
def snip1
	'4' == 4 ? puts("TRUE") : puts("FALSE")
end

# Snippet 2
def snip2()
	x = 2
	if ((x * 3) / 2) == (4 + 4 - x - 3)
	  puts "Did you get it right?"
	else
	  puts "Did you?"
	end
end


# Snippet 3
def snip3
	y = 9
	x = 10
	if (x + 1) <= (y)
	  puts "Alright."
	elsif (x + 1) >= (y)
	  puts "Alright now!"
	elsif (y + 1) == x
	  puts "ALRIGHT NOW!"
	else
	  puts "Alrighty!"
	end
end

puts "Snip 1: #{snip1}"
puts "Snip 2: #{snip2}"
puts "Snip 3: #{snip3}"