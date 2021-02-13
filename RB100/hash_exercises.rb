=begin
family = { uncles: ["rob", "mark", "tom"],
					 sisters: ["joojoo", "mikka", "philla"],
					 brothers: ["mon", "momo", "vix"],
					 aunts: ["hilda", "matilda", "jane"]
					}

immediate = [:sisters, :brothers]
close_family = family.select {|k,v| immediate.include? k}
p close_family
=end

=begin
# difference between merge and merge!
dogs = {old: "Rex", pup: "Piper"}
cats = {old: "Fluffer", kitten: "Mewmew"}
pets = dogs.merge(cats)
p pets
=end

=begin
# printing hashes, keys, and values
def print_keys(hash)
	hash.keys.each {|k| puts k}
end

def print_vals(hash)
	hash.values.each {|v| puts v}
end

def print_hash(hash)
	hash.each {|k,v| puts "#{k}:#{v}"}
end
=end

# Challenge
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
=begin THIS WAS MY VERSION
anagrams = []
# print all anagrams
while !words.empty? do
	words_copy = words.clone
	word_cont = [].push words_copy[0] # get first word
	words.delete word_cont.first # delete first word from original
	words_copy.delete_if do |w|
		del_flag = false
		w.each_char do |c|
			del_flag = true if !(word_cont.first.include? c)
		end
		del_flag
	end
	anagrams.push words_copy
	words_copy.each do |w|
		words.delete(w)
	end
end

puts anagrams
=end

results = {} # make hash for results

words.each do |word|
	key = word.split('').sort.join
	if results.has_key?(key)
		results[key].push(word)
	else
		results[key] = [word]
	end
end

results.each do |k,v|
	puts '-----'
	p v
end