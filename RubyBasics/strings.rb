# create a string
a = ""

# quote confusion
#orig: puts 'It\'s now 12 o\'clock.'
#puts "It's now 12 o'clock."
#alt syntax:
#puts %Q(I'm thinking she said, "Wait, ma'am, what about me?")

# # ignoring case
# name = 'Roger'
# puts name.downcase == "RoGeR".downcase
# puts name.downcase == "DAVE".downcase
# # I read about the casecmp method, though I was confused about #casecmp? because the length didn't seem to matter
# puts name.casecmp("RoGeR") == 0
# puts name.casecmp("DAVE") == 0


# dynamic string
name = 'Elizabeth'
#puts "Hello, #{name}!"

# combining strings
first_name = 'John'
last_name = 'Doe'
full_name = String.new << first_name << " " << last_name
#full_name = "#{first_name} #{last_name}"
#full_name << first_name << " " << last_name
#puts full_name

# tricky formatting
state = 'tExAs'
state.capitalize!
#puts state


# goodbye, not hello
greeting = 'Hello!'
#greeting = "Goodbye!" # I thought this was a trick question. Heh.
greeting.gsub!("Hello!", "Goodbye!")
#puts greeting


# print the alphabet
alphabet = 'abcdefghijklmnopqrstuvwxyz'
#puts alphabet.split('')
# originally I iterated over characters. missed the word split in the problem description


# pluralize
words = 'car human elephant airplane'
#words.split(" ").each {|word| puts word + "s"}


# are you there?
colors = 'blue pink yellow orange'
puts colors.include?("yellow")
puts colors["purple"] != nil