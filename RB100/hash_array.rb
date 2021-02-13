# array of hashes?

arr = [
	{:name => "Sunny",
	 :job => "Dad",
	 :score => 3.33},
	{:name => "Anahata",
	 :job => "Mom",
	 :score => 9.99},
	{:name => "ChupiDude",
	 :job => "Baby",
	 :score => 1}
]

arr.each do |x|
	x.each do |k, v|
		puts "My #{k} is #{v}!"
	end
end
