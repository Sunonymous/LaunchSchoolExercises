# reading error messages
def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

find_first_nonzero_among([0, 0, 1, 0, 2, 0])
find_first_nonzero_among([1])
# method was expecting something to iterate over. Can't iterate over integers


# weather forecast
def predict_weather
  sunshine = [true, false].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end
# those are strings, not booleans...
# booleans is a weird word


# multiply by five
def multiply_by_five(n)
  n * 5
end

# puts "Hello! Which number would you like to multiply by 5?"
# number = gets.chomp.to_i
# puts "The result is #{multiply_by_five(number)}!"
# multiplying strings, eh? That's not very conventional in math.


# pets
pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }
pets[:dog].push 'bowser' # can't ditch em all now, can we??
# p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}


# EVEN NUMBERS oops caps
numbers = [5, 2, 9, 6, 3, 1, 8]
even_numbers = numbers.select do |n|
  n if n.even? # didn't think to change this, though I understand the distinction
  # it's the same because no value isn't truthy anyway
end
#p even_numbers # expected output: [2, 6, 8]
# must be a lot of people confusing map and select


# confuscius says
def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  elsif person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  elsif person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end
#puts 'Confucius says:'
#puts '"' + get_quote('Confucius') + '"'
# since there were no explicit returns, it wasn't returning anything because it was not the last expression evaluated


# account balance
# Financially, you started the year with a clean slate.

balance = 0
# Here's what you earned and spent during the first three months.
january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}
february = {
  income: [ 1200 ],
  expenses: [ 650, 140, 320, 46.7, 122.5 ]
}
march = {
  income: [ 1200, 10, 75 ],
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
}
# Let's see how much you've got now...
def calculate_balance(month)
  plus  = month[:income].sum
  minus = month[:expenses].sum

  plus - minus
end
[january, february, march].each do |month|
  balance += calculate_balance(month)
end

# puts balance
# I had the suspicion that balance was being reassigned at every loop, and I was right
# I added the income and subtracted expenses of march to test this based on that the script was giving 70

=begin
# colorful things
colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  #break if i > colors.length
  break if i > [colors.length, things.length].min - 1

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
  	puts i
    puts ('And a ' + colors[i] + ' ' + things[i] + '.') #if colors[i] != nil && things[i] != nil #this was my original thought
  end

  i += 1
end
# this one I'm not sure about. It's acting like colors[i] (or things) is giving an integer.
# ah, okay. I didn't bother to check the length of both arrays because I assumed LS kept it simple and left them the same size
# is nil considered an integer??
=end



# digit product
def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 1
  digits.each do |digit|
    product *= digit
  end
  product
end
#p digit_product('12345')
# expected return value: 120
# actual return value: 0
# this is one of those really stupid errors that you don't see for a long time and then once you realize it you can't believe you couldn't see it.
# that wasn't my experience with this question, though I've had that many times with various other things.


# warriors and wizards
# Each player starts with the same basic stats.
player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.
character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase.to_sym

player.merge!(character_classes[input])

puts 'Your character stats:'
puts player