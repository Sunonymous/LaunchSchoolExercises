# breakfast, lunch, or dinner? part one
def meal
  return 'Breakfast'
end
#puts meal
# should print 'Breakfast'

# part two
def meal2
  'Evening'
end
#puts meal2

# part three
# I'm deciding not to copy and paste these questions,
#    since no changes to the code are being made.

# I'll note my thought process on part five
def meal5
  'Dinner'
  puts 'Dinner'
end
#p meal5
# 'Dinner' the first time is just evaluated and nothing is done with it.
# the second time is will be displayed, though not returned.
# because it is puts it should return nil. I'm guessing that with p instead of puts, nil is displayed
# So I'm thinking 'Dinner\nnil'

# part 6 is simple
# return is early so only 'Breakfast'

# counting sheep part one
def count_sheep
  5.times do |sheep|
    puts sheep
  end
end
#puts count_sheep
# with sheep as the method var taking the zero-indexed number of the iteration, it will print '0\n1\n2\n3\n4\n\n'
# extra blank line because the method returns nil
# hmm? Okay this one I'm confused on. Why did it print up to five?
# did /not/ know that #times returns its value! Interesting...

# counting sheep part two
def count_sheep2
  5.times do |sheep|
    puts sheep
  end
  10
end
#puts count_sheep2
# based on the understanding of the last exercise, this should print '0\n1\n2\n3\n4\n10'
# 10 should replace the return value of .times because times is no longer the last evaluation
# I was right

# counting sheep part three
def count_sheep3
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end
#p count_sheep3
# iterations starts at 0 and ends at 2, so it should print '0\n1\n2\n5'
# why did it return nil and not 5 at the end? I understand that p prints differently,
#   though shouldn't the last return value still be the int caller of times?
# oh--psh. silly me overlooking the fact that the return didn't specify a value.
#    darn you gdscript and your frequent empty returns!! you've numbed me
# I was wondering why they used p... makes sense.

# tricky number
def tricky_number
  if true
    number = 1
  else
    2
  end
end
puts tricky_number
# the obvious response is 1, though I am still reflecting on that.
# I wasn't sure if assignment counts as evaluation, which I tested and it does.
# I (naturally) feel like this is a trick question, but I have to guess 1
# I was right. :p

