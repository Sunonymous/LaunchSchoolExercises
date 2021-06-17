# Create the Class

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  def greet
    puts "Hello! My name is #{name}!"
  end
end

squill = Cat.new('Squill')
squill.name = 'Luna'
squill.greet
squill.walk



