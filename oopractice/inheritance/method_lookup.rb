# Method Lookup P1

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color # Checks in Cat, then Animal

# P2
# Without the method being present, Ruby will look through
# Cat
# Animal
# Object
# Kernel
# BasicObject

# P3

module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color # Checks in Bird, then Flyable, then Animal
