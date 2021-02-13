# ruby ruby

# given a digit and the position to find, return the digit in that position.

def get_digit(num, pos)
	# pos should be a factor of 10
	# e.g. the decimal in the hundreds position would be pos 100
	# check edge cases
	return "Error: Can't calculate position given." if num <= pos || num <= 0
	# ensure pos is multiple of ten
	len = pos.to_s.length - 1
	return "Error: pos is not a power of ten." if pos >= 10 && pos % 10**len != 0
	case pos
		when 1 then return (num % 10)
		else
			(num % (10**(len+1))) / (10**(len))
	end
end

puts get_digit(1234, 10)