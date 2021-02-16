=begin
# new pet
pets = ['cat', 'dog', 'fish', 'lizard']
my_pet = pets[2]
#puts "I have a pet #{my_pet}"


# more than one
my_pets = pets.select {|p| p == 'fish' || p == 'lizard'}
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}."
# there I go overengineering again.
# point is, I can do ranged indexes in bracket notation of arrays

# free the lizard
my_pets.pop
puts "I have a pet #{my_pets.first}."


# one isn't enough
my_pets.push pets[1]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}."
=end

# what color are you?
colors = ['red', 'yellow', 'purple', 'green']
#colors.each {|c| puts "I am the color #{c}!"}


# doubled
numbers = [1, 2, 3, 4, 5]
doubled_numbers = numbers.map {|n| n*2}
#p doubled_numbers


# divisible by three
numbers = [5, 9, 21, 26, 39]
divisble_by_three = numbers.select {|n| n % 3 == 0}
#p divisble_by_three


# favorite number part one
[['Dave', 7], ['Miranda', 3], ['Jason', 11]]


# favorite number part two
favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
#p favorites.flatten!


# are we the same?
array1 = [1, 5, 9]
array2 = [1, 9, 5]
p array1 == array2