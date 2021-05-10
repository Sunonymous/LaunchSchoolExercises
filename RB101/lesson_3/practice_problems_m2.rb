# Practice Problems Medium 2
#
# 1) I had issues running the code because the inner variables weren't accessible
#    outside the block. Seems that is known. I'm following well with these examples.
# 2) So summary--methods can't reach outside themselves, and reassignment does change
#    ids, but won't mutate parameters.
# 3) The string is unchanged, printing "pumpkins", but << mutates the array and
#    adds "rutabaga".
# 4) This isn't really a question... more of a demonstration of the opposite of the
#    prior question. Still useful, though I've gotten the point now! : )
# 5) Changing it to be more predictable depends on the intended results of the function!
#    Change both operators either to mutate or not. Then change the way the function is
#    called in order to use it in the intended manner.
#    After seeing the solution, it is more useful to return two variables. I suppose
#    being explicit is the ideal approach in this situation. It leaves no room for question.
# 6) Return the expression (color == 'blue' || color == 'green')
#    OR, initialize an array with the valid choices and return whether or not color is included.
