def age_increments(age, decades)
	(decades+1).times do |x|
		next if x == 0
		puts "In #{x*10} years you will be #{age+(x*10)} years old!"
	end
end


puts "How old are you?"
age = gets.chomp.to_i

age_increments(age, 4)