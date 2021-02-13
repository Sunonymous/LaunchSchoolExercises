# to finish the book!!

#ex 1
#[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each {|x| puts x}

#ex 2
#[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each {|x| puts x if x > 5}

#ex 3
=begin
new = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select do |x|
	x.odd?
end
p new
=end

=begin
#ex 4
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].push 11
arr.unshift 0
p arr
#ex 5
arr.delete 11
arr.push 3
#ex 6
arr.uniq!
p arr
=end

#ex 8
#hash_old = {"super" => "duper"}
#hash_new = {super: "duper"}

#ex 9
=begin 
h = {a:1, b:2, c:3, d:4}
puts "b = #{h[:b]}"
h[:e] = 5
h.delete_if { |k,v| v < 3.5 }
p h
=end

#ex 10
=begin
# yes yes
hash_arr = {
	ints: [1, 2, 3],
	floats: [1.0, 2.0, 3.0]
}
arr_hash = [{cat: "fluffy", dog: "yerbo"}, {yellow: "banana", purple: "grape"}]
=end

#ex 11
=begin
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts.each do |person, data|
	# check if person is in data
	contact_data.each do |groups|
		groups.each do |info|
			if info.include? person.split(" ").first.downcase
				contacts[person][:email] = groups[0]
				contacts[person][:address] = groups[1]
				contacts[person][:phone] = groups[2]
			end
		end
	end
end
#puts contacts

#ex 12
puts "Joe's phone number is #{contacts["Joe Smith"][:phone]}."
puts "Sally's email address is #{contacts["Sally Johnson"][:email]}."
=end

=begin
#ex 13
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |word| word.start_with? "s" }
arr.delete_if { |word|	word.start_with? "w" }
p arr
=end

#ex 14
=begin
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a.map! do |phrase|
	(phrase.split " ")
end
a.flatten!
p a
=end

#ex 15
hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
	puts "Same thing, boss!"
else
	puts "Different things, boss!"
end
