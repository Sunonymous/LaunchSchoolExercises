# Nobility

module Moveable
  def walk
    "#{self.name} #{gait} forward"
  end
end

class Noble
  include Moveable
  attr_reader :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def name
    "#{title} #{@name}"
  end

  def gait
    'struts'
  end
end

class Cat
  attr_reader :name
  include Moveable

  def initialize(name)
    @name = name
  end

  def gait
    'saunters'
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk
cat = Cat.new('Cat')
p cat.walk
