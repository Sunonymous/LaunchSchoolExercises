loop do
	puts "Do you want to do that again?"
	answer = gets.chomp
	if answer.upcase != 'Y' && answer.upcase != 'YES'
		break
	end	
end