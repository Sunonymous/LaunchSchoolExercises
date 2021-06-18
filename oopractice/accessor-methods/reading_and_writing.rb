# Reading and Writing

class Person
  attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name

# Choosing the Right Method

class Person
  attr_writer :phone_number
end

person1.phone_number = '0123456789'

