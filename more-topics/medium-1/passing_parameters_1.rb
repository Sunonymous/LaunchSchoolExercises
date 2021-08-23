# Passing Parameters Part One

# Modify the below code to make the code below more opern-ended, using a block.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  puts "#{items.join(', ')}"
  puts "Nice selection of food we have gathered!"
end

def gather(items, description = 'items')
  puts "Let's start gathering #{description}."
  yield items
  puts "Nice selection of #{description} we have gathered!"
end

gather(items, 'food') do |items|
  print 'Okay, we have: '
  puts "#{items.join(', ')}."
end

puts; puts

things = ['sticks', 'rocks', 'mud', 'leaves']
gather(things, 'things') do |stuff|
  print 'Alright, we\'ve got: '
  puts "#{stuff[0..-2].join(', ')}, and #{stuff.last}."
  puts 'That looks like everything we need to build dinner. Get to it!'
end
