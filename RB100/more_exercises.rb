# exercises!!

#ex 1
words = ["laboratory", "experiment", "Pan's Labyrinth", "Elaborate", "Polar Bear"]
results = []
words.each do |word|
	if word.downcase =~ /lab/ #change to downcase if needed
		results.push word
	end
end

p results