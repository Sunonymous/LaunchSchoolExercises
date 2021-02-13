names = ['Sunny', 'Sweetie', 'Baby', 'Grandma', 'Doopy']


idx = 1
names.each do |n|
	puts "#{idx}. #{n}"
	idx += 1
end

x = [1, 2, 3, 4, 5]
done = []
x.each do |n|
	done.push n += 1
end
p done

