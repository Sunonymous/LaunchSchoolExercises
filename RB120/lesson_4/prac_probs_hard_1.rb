# Practice Problems Hard 1

# 1. 
class SecretFile
  def initialize(secret_data, logger)
    @data = secret_data
    @log = logger
  end

  def read_data
    @log.create_log_entry()
    @data
  end
end

class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
  end
end

# 2.
module Fuelable
  attr_accessor :fuel_efficiency, :fuel_capacity

  def range
    self.fuel_capacity * self.fuel_efficiency
  end
end

class WheeledVehicle
  include Fuelable
  attr_accessor :speed, :heading

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class WaterVehicle
  include Fuelable
  attr_reader :propeller_count, :hull_count
  attr_accessor :speed, :heading

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
  
  def range
    #(self.fuel_efficiency * self.fuel_capacity) + 10
    super + 10 # shortcut!!
  end
end

class Catamaran < WaterVehicle
end

class Motorboat < WaterVehicle
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

# 3. We could create a WaterVehicle class with the Fuelable module mixed in and
#     have the Catamaran and the Motorboat inherit from that. It would include
#     the number of propellers and hulls as instance variables. Because the 
#     Motorboat class has a fixed number of propellers and hulls, we can remove
#     those from the instance constructor and pass in only the fuel information,
#     calling the constructor of the super class with the needed data.
# 4. 
