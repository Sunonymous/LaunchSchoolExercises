#1
# 7 because of method scope
# the value of a is copied to the method variable b and changed. a is unaltered.

#2
# 7 because of method scope
# this is the same as the previous. a is passed in by value and not changed.

#3
# 7
# the a in the method definition cannot reach outside itself to get a, so it creates its own version of a

#4
# "Xy-zy"
# I was originally wrong on this question. I learned that str#[]= mutates the caller. Gotta stop making these comparisons to Python... I noted the distinction.

#5
# "Xyzzy"
# this assignment is not mutating the original argument. It is assigning the method copy to a new object.

#6
# this should give an error
# my_value cannot reach the local a outside of it, and therefore it's reaching for a variable that it can't see.
# I'm noting mentally that this is a NameError

#7
# 3
# the each method iterates through the elements, reassigning a three times, ending on 3
# we just ended by saying that blocks and procs have closure to reach local variables

#8
# I expect an error from this one. Even though blocks can reach outward, the puts at the end is referencing a variable created ("initialized") within a block
# which cannot be accessed in that way. Another NameError!

#9
# 10
# a is initialized outside of the block, which can access it. Numbers are immutable and reassigned to new literals (yay dynamic languages!), so a is reassigned via addition three times to reach 10
# shit! I didn't notice that the each block had the variable name `a` too. that's something I wouldn't have done and didn't pay enough attention.
# this concept is apparently called shadowing.
# if I would have noticed, I would have understood. that would have returned a new array of [2, 3, 4] and done nothing to the local a

#10
# I think this one will give another NameError
# even though blocks can reach outwards, this block is contained inside a method definition, which I believe would prevent that.
# Okay, so I was right about the error, but its a NoMethodError. Since a doesn't exist in the method, it's trying to call a method on `nil`, which doesn't have it.