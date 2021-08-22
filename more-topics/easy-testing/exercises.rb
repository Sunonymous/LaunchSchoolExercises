# More Topics - Easy Testing Exercises

# Easier to create all of these in one file.

require 'minitest/autorun'

# Exception Assertions
# This one is a good bit to randomly implement.
class NoExperienceError < StandardError
end
class Employee
  def initialize
    @hireable = 'obviously not'
  end

  def hire
    raise NoExperienceError unless @hireable == 'totally'
  end
end

class Array
  def process
    # super useful method. don't lose it!!
    stored = pop
    push(stored)
  end
end

class TestingExercises < Minitest::Test
  def setup
  end

  # Boolean Assertions
  def test_boolean_assertions
    value = 5
    assert(value.odd?)
    assert_equal(true, value.odd?) # okay, better form, yes yes.
  end

  # Equality Assertions
  def test_equality
    value = "XYZ"
    assert_equal('xyz', value.downcase)
  end

  # Assert Nil
  def test_nil
    value = nil
    assert_nil(value)
  end

  # Empty Object Assertions
  def test_empty_object
    list = [7]
    list.pop
    assert_empty(list)
  end

  # Included Object Assertions
  def test_inclusion_in_object
    list = ('A'..'Z').to_a.join.downcase
    assert_includes(list, 'xyz')
  end

  # Exception Assertions
  def test_exception
    employee = Employee.new
    assert_raises(NoExperienceError) { employee.hire }
  end

  # Type Assertions
  def test_type
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end

  # Kind Assertions
  def test_kind_of
    value = 7.5888
    assert_kind_of(Numeric, value)
  end

  # Same Object Assertions
  def test_same_object
    list = [1, 2, 3]
    assert_same(list, list.process)
  end

  # Refutations
  def test_does_not_include
    list = ('A'..'W').to_a.join.downcase
    refute_includes(list, 'xyz')
  end
end
