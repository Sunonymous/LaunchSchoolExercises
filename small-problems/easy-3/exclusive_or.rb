# Exclusive Or
#
def xor(expression1, expression2)
  condition1 = (expression1 && !expression2)
  condition2 = (!expression1 && expression2)
  condition1 || condition2
end

