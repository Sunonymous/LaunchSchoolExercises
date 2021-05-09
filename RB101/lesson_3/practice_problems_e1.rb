# Practice Problems Easy-1
#
# 1 ) [1, 2, 2, 3]
#   The form of uniq called does not mutate caller.
#   Hmm... I should be more specific in my formatting.
# 2 ) ! and ?
#   1. `!=` is the 'different than' operator, and returns
#     a boolean of whether or not its operands are different.
#   2. `!` converts its operand to a boolean and inverts it.
#   3. Conventionally, `!` when suffixing a method name 
#     indicates that the method is destructive, and/or mutates
#     its caller.
#   4. `?` after a method name suggests the method will return
#     true or false. After an expression, `?` instigates the
#     ternary operator.
#   5. I'm not sure what `?` before something does, apart from
#     separate the expression from the return values in 
#     ternary operations.
#   6. `!!` converts its operand into the boolean which
#     matches its truthiness.
# 3)
advice = 'Few things in life are as important as house training your pet dinosaur.'
advice = advice.split()
advice[6] = 'urgent'
advice = advice.join(" ")
puts advice
# Oops--I took the long road home here.
# 4) Delete_at removes 2, which is at index 1, from the array.
#    Delete removes the instance of number 1 from the array.
# 5) 
puts "Heck yeah!" if (10..100).include?(42)
# 6) 
famous_words = "seven years ago..."
# famous_words = "Four score and " << famous_words
famous_words.reverse!
(famous_words += ("Four score and ".reverse!)).reverse!
puts famous_words
# 7) flintstones.flatten!
# 8)
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.keep_if {|key, _| key == "Barney"}
p flintstones.to_a.flatten
# Kind of clunky because I missed the array bit the first read through.
