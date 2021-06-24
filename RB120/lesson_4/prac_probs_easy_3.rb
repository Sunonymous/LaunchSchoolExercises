# Practice Problems: Easy 3

# 1. C1 -> puts 'Hello' C2 -> NoMethodError C3 -> ArgumentError C4 -> puts 'Goodbye' C5 -> NoMethodError
# 2. Either make hi a class method via def self.hi or use Hello.new.hi
#     I didn't realize the thing about the super method being unavailable w/o an instance.
# 3. AngryCat.new(5, 'Pickles') AngryCat.new(8, 'Filibuster')
# 4. Override the to_s method by definining a new one which returns the desired string.
# 5. tv.manufacturer would not work because it is a class method. tv.model is fine.
#    Television.manufacturer works as expected, while Television.model raises an exception.
# 6. You should be able to remove the self keyword without consequences because of
#    the accessor. You may also reference the instance variable directly with @age.
# 7. The class method information returns the same string in every object, despite
#    any difference in instance state. The return keyword is also unnecessary.
