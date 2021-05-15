# Practice Problems: Additional Practice
#
# 1)
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}
flintstones.each do |name|
  flintstones_hash[name] = flintstones.index(name)
end
# 2)
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total = 0
ages.each { |_, v| total += v }
# practice writing
# p ages.values.reduce(:+)
# 3)
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if { |_, v| v >= 100 }
# 4)
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# p ages.values.min
# 5)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
idx = 0
caught = loop do
  break idx if flintstones[idx].start_with?('Be')
  idx += 1
end
caught
# I didn't know index could take a block!!
# 6)
flintstones.map! { |name| name[0..2] }
# 7)
statement = "The Flintstones Rock"
hash = Hash.new(0)
statement.split.join.each_char { |c| hash[c] += 1 }
# My solution isn't for general purpose, as it would include symbols too.
# 8)
# The first iteration prints 1, then removes 1 from the array. The second time,
# it seems like it should print 2 and remove 2, and so on... However, this is 
# misguided. The #each loop uses the same indexes as suggested by the original
# array, so when it removes an element from the array, the original indexes are
# not able to reach the elements which they were intended to be attached to.
# 9)
words = "the flintstones rock"
words = words.split.map { |word| word.capitalize }.join(' ')
# 10)
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
munsters.keys.each do |munster|
  munsters[munster]['age_group'] =
    case munsters[munster]['age']
    when (0..17) then 'kid'
    when (18..64) then 'adult'
    when (65..) then 'senior'
    end
end
puts munsters
# Their example is much more readable than mine!
