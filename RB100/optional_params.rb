def greeting(name, options={})
	# if hash is empty, default greeting
	if options.empty?
		puts "Hello, my name is #{name}."
	else # hash has data
		puts "Hello, my name is #{name} and I am #{options[:age]} years old!"
	end
end


greeting("Sunny", age: 27)