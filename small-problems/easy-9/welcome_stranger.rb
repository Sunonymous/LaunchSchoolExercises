# Welcome Stranger
#
# Problem     |---------------------------------------------------------------|
#             |Given two arguments of an array and a hash, use the specified
#             |arguments to return a string using the data provided within the
#             |arguments. The string is a greeting.
#       Input |Array with name strings, hash with title and occupation keys
#       Output|Formatted greeting string with interpolated values from arguments
#       Edges |Not enough examples to suggest handling edge cases.
#       Rules |Array will contain two or more strings of a name.
#             |Hash will contain two keys of symbols :title and :occupation
#   Questions |
# Example     |---------------------------------------------------------------|
# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
# Data        |---------------------------------------------------------------|
#             |Hashes and arrays are given and referenced.
# Algorithm   |---------------------------------------------------------------|
#             |Join the name string values using a space and insert into the
#             |  string.
#             |Reference the hash's title and occupation keys and insert into
#             |  the string.
# Code________|_______________________________________________________________|
#
def greetings(names, job)
  name = names.join(' ')
  job = "#{job[:title]} #{job[:occupation]}"
  "Hello, #{name}! Nice to have a #{job} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) == 'Hello, John Q Doe! Nice to have a Master Plumber around.'
