# Class and Instance Methods
# I spent a long time here trying to understand any functional difference between the two methods,
# which there seems to be little of. I already understand the difference between class and instance
# methods.

# Optional Arguments Redux
# Without the arguments given, the day and month default to 1 and the year defaults to -4712 (??).
# Because they are used after a puts statement, #to_s is called implicitly.
# Date.civil              >> "-4712-01-01"
# Date.civil(2016)        >> "2016-01-01"
# Date.civil(2016, 5)     >> "2016-05-01"
# Date.civil(2016, 5, 13) >> "2016-05-13"
# I did learn about Julian Dates a little bit though! That was interesting. Not enough to really use
# them yet.
#
# Default Arguments in the Middle
# Ruby is pretty flexible! I read that default arguments don't need to be first or last,
# they just need to be grouped together. So it prints out [4, 5, 3, 6], since only the 
# b is supplied.
#
# Mandatory Blocks
# a.bsearch { |x| x > 8 }
#
# Multiple Signatures
# Okay, cool. I like that I learned this method more clearly. So fetch can be given a default value to
# use if it reaches for something outside of the range of the array. It may also be given a block which
# it can use to reference an out-of-bounds index.
# a.fetch(7)                    >> throws an IndexError
# a.fetch(7, "beats me!")       >> "beats me!"
# a.fetch(7) {|i| i**2}         >> 49
#
# Keyword Arguments
# Took me a minute to find step as a numeric method. I had sort of remembered that but I checked enumerator
# first. So we're calling step with keyword arguments, which is a valid signature.
# This should print out 5 and 8 on their own lines.
#
# Parent Class
# If I add the false argument (which overrides a default true) to the public_methods call, it will only
# give me those from the class itself.
# puts s.public_methods(false).inspect
#
# Included Modules
# I found the min method in Enumerable in the older docs, which, when supplied with an integer argument,
# will supply the n smallest values.
# puts a.min(2)
#
# Down the Rabbit Hole
# This one was mainly just searching for the YAML API documenntation, which was not as easy as it should be.
