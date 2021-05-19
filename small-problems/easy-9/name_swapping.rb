# Name Swapping
#
# Problem     |---------------------------------------------------------------|
#             |Given a string of a name, return the name in 'library author' format.
#       Input |A string, 'First_name Last_name'
#       Output|A string, 'Last_name, First_name'
#       Edges |Examples suggest that input validation is not necessary.
#       Rules |The output string will contain the last name, a comma, and the 
#             |  first name
#             |The input is given in the reversed (normal) order
#   Questions |
# Example     |---------------------------------------------------------------|
# swap_name('Joe Roberts') == 'Roberts, Joe'
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |Split the string by a space into two separate names
#             |Format and return the reversed string.
# Code________|_______________________________________________________________|
#
def swap_name(name)
  first_name, last_name = name.split(' ')
  "#{last_name}, #{first_name}"
end

# Join does seems simpler, though mine is very literal.
puts swap_name('Joe Roberts') == 'Roberts, Joe'
