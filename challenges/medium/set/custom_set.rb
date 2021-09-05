# frozen_string_literal: true

# Custom Set

# Architecture
# CustomSet is a class. It is able to contain a unique (ie. none repeated) group
#   of numbers. Its constructor requires no arguments, and may be passed an array
#   of numbers for inclusion.
#
# It contains the following instance methods:
# CustomSet#empty? - Returns true/false if it contains any numbers.
# CustomSet#contains?(num) - Returns true and false if <num> is in set.
# CustomSet#subset?(CS) - Returns true if receiver is empty and/or all elements
#   inside receiver exist inside CS; false otherwise.
# CustomSet#disjoint?(CS) - Returns true if either or both sets are empty, or if
#   receiver and CS contain no shared elements; false otherwise.
# CustomSet#eql?(CS) - Returns true if receiver and CS contain the same elements.
# CustomSet#==(CS) - same as above.
# CustomSet#add(em) - adds element to set if not already present.
# CustomSet#intersection(CS) - Returns a new set containing all the shared items
#   between the receiver and the argument set.
# CustomSet#difference(CS) - Returns a new set containing all of the elements in
#   the receiver that do not exist in the CS set.
# CustomSet#union(CS) - Returns a new set containing the combined elements from
#   the receiver and CS.

# First thing is first: let's play with the constructor to get it to accept the
#   splat operator and spread its arguments to an array (later for the add method).

# Reading my descriptions of the instance methods was really enough to understand
#   what needed to be done. This exercise, when used with pre-existing methods
#   from superclasses, is rather simple.

# CustomSet is a class which contains a set of unique numbers with several
# methods to manipulate them, especially in conjunction with other CustomSets.
class CustomSet
  def initialize(numbers_array = [])
    @set = numbers_array
    @set.flatten!
    @set.uniq!
    @set.sort!
  end

  attr_reader :set

  def empty?
    @set.empty?
  end

  def contains?(num)
    @set.include?(num)
  end

  def subset?(other)
    set.each { |num| return false unless other.set.include?(num) }
    true
  end

  def disjoint?(other)
    set.each { |num| return false if other.set.include?(num) }
    true
  end

  def eql?(other)
    @set == other.set
  end
  alias == eql?

  def add(number)
    set.push(number) unless contains?(number)
    set.sort! # was causing me a strange error!
    self
  end

  def intersection(other)
    shared = []
    set.each { |num| shared << num if other.set.include?(num) }
    CustomSet.new(shared)
  end

  def difference(other)
    unique = []
    set.each { |num| unique << num unless other.set.include?(num) }
    CustomSet.new(unique)
  end

  def union(other)
    combined = []
    set.each { |num| combined << num }
    other.set.each { |num| combined << num }
    CustomSet.new(combined)
  end
end

test = CustomSet.new([5, 4, 2, 2, 1])
test2 = CustomSet.new([1, 2, 4, 5])
p test == test2
