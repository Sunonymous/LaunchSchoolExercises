# Practice Problems - Methods and More Methods
#
# 1) The select object will return [1, 2, 3] because the last evalution is the
# string 'hi', which, because it is truthy, will 'select' all of the elements.
# 2) Array#count keeps a total count of all of the elements which the block's
# expression returns true for.
# 3) Because puts returns nil, all of the items in the array will be spared,
# and the #reject method will return [1, 2, 3]. Were the block to return true,
# then the elements for which it returned true would be removed.
# 4) The return value will be {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}
# 5) Hash#shift returns an array of [key, val] of an item in the hash.
# 6) Array#pop removes the last element, and calling #size on 'caterpillar'
# should return 11.
# 7) Array#any? should return true because the block is returning true on the
# elements 1 and 3.
# 8) Array#take returns the first n arguments from an array, non-destructively.
# 9) The first thing that I noticed is that we're mapping over a hash, which is
# odd, and only giving one value as a return. The first iteration returns nil
# and the second 'bear'. I'm not sure if it is changing the values itself, or...
# Okay, so what I need to remember here is that map always returns an array.
# 10) This map should return [1, nil, nil], because the if condition evaluates
# to true for the second and third elements, which puts the number (returning
# nil). The first element doesn't meet the condition so it hits the else branch
# and comes back as itself.
