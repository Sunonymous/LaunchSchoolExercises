# Practice Problems Hard 1
#
# 1) I expect a NoMethodError. I didn't know that about the if block instantiation!
# 2) The question comes down to whether informal_greeting has the same address as
#    greetings[:a], which I assume it must, because they were assigned to the same
#    id and << did not change it. so greetings should puts "{:a=>'hi there'}"
# 3) Example A) does nothing to change the variables. Neither does example B).
#    However, C), while super hacky, does alter all the original strings.
# 4) After the split, add a condition to return false if size of dot_separated_words
#    is different than four. Then, replace break with return false.
