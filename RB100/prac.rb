#factorial
def factorial(n)
	i = 1
	result = 1
	n.times do
		result *= i
		i += 1
	end
	result
end

=begin
puts factorial(5)
puts factorial(6)
puts factorial(7)
puts factorial(8)
=end

def calcfloatsquares(x, y, z)
	puts "#{x} squared is #{(x**2)}"
	puts "#{y} squared is #{(y**2)}"
	puts "#{z} squared is #{(z**2)}"
end

#calcfloatsquares(1.23, 2.34, 3.45)


def capsiftenplus(string)
	string.length > 10 ? string.upcase : string
end

def analyze_number()
	puts "Please give me a number between 0 and 100."
	num = gets.chomp.to_i
	lead_in = "Your number is between "
	case num
	when 0..50 then puts lead_in + "zero and fifty."
	when 51..100 then puts lead_in + "fifty-one and one hundred."
	else puts "Must be out of my range..."
	end
	puts "Wow, that's more than one hundred. What gives?" if num > 100
end

