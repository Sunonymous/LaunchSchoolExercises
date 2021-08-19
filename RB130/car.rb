# Car

class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other)
    Car === other && self.name == other.name
  end
end


