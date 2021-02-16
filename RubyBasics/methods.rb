# print me part one and two
def print_me
	"I'm printing within the method!"
end

#puts print_me

# greeting through methods part one
def salute
	"Hello"
end
def location
	"World"
end
#puts "#{salute} #{location}"

# greeting through methods part two
def greet
	salute + " " + location
end
#puts greet

# make and model
def car(make, model)
	puts "#{make} #{model}"
end
#car("Toyota", "Corolla")


# day or night?
daylight = [true, false].sample
def time_of_day(time)
	puts time ? "It's daytime!" : "It's nighttime!"
end
#time_of_day(daylight)


# naming animals
def dog(name)
  return name
end

def cat(name)
  return name
end
#puts "The dog's name is #{dog('Spot')}."
#puts "The cat's name is #{cat("Ginger")}."


# name not found
def assign_name(name="Bob")
	name
end
#puts assign_name('Kevin') == 'Kevin'
#puts assign_name == 'Bob'


# multiply the sum
def add(a, b)
	a + b
end
def multiply(a, b)
	a * b
end
#puts add(2, 2) == 4
#puts add(5, 4) == 9
#puts multiply(add(2, 2), add(5, 4)) == 36


# random sentence
names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']
def name(arr)
	arr.sample
end
def activity(arr)
	arr.sample
end
def sentence(person, doing)
	"#{person} did some #{doing} today, y'hear?"
end
puts sentence(name(names), activity(activities))