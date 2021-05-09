# Practice Problems Easy 2
#
# 1) 
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# puts ages.include?('Spot')
# puts ages.member?('Spot')
# puts ages['Spot'] != nil
# puts ages.key?('Spot')
# 2) 
# munsters_description = "The Munsters are creepy in a good way."
# puts munsters_description.swapcase!
# puts munsters_description.downcase.capitalize!
# puts munsters_description.downcase!
# puts munsters_description.upcase!
# I didn't know capitalize lowers the rest of the string! Cool.
# 3)
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# additional_ages = { "Marilyn" => 22, "Spot" => 237 }
# ages.merge!(additional_ages)
# ages["Marilyn"] = 22
# ages["Spot"] = 237
# p ages
# 4)
advice = "Few things in life are as important as house training your pet dinosaur."
# puts advice.match?(/Dino/)
# 5) flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
# flintstones =  %w(Fred Barney Wilma Betty BamBam Pebbles)
# 6) 
# flintstones.push("Dino")
# 7)
# flintstones.push('Dino', 'Hoppy')
# p flintstones
# 8) 
# puts advice.slice!(38..-1)
# puts advice
# 9)
statement = "The Flintstones Rock!"
puts statement.count('t')
# 10)
title = "Flintstone Family Members"
puts title.center(40)
