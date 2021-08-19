# Tests for Car

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < Minitest::Test
  def setup
    @car = Car.new
  end

  def test_car_exists
    assert(@car)
  end

  def test_name_is_nil_by_default
    assert_nil(@car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: 'Jimbob')
    end
    
  end

  def test_assert_instance_of
    assert_instance_of(Car, @car)
  end

  def test_includes_car
    arr = [1, 2, 3]
    arr << @car
    assert_includes(arr, @car)
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = 'Scooby'
    car2.name = 'Scooby'

    assert_equal(car1, car2)
    refute_same(car1, car2)
  end
end
