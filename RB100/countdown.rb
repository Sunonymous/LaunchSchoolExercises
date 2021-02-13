=begin
puts "When should I start the countdown? From what number?"
num = gets.chomp.to_i

while num >= 0
	puts num
	num -= 1
end

puts "I have reached zero!"
puts "Done!"
=end

def recursive_countdown(n)
	puts n
	if n <= 0
		return 0
	else
		recursive_countdown(n-1)
	end
end

recursive_countdown(10)