# iter ex 2

x = 7

loop do
	puts "I'm going to do some stuff. When you're done, tell me to 'STOP'."
	answer = gets.chomp
	if answer.upcase == "STOP"
		break
	end
	if x.odd?
		x += x / 2
	else #even
		x += x / 3
	end
	puts x
end
