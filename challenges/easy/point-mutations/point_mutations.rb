# frozen_string_literal: true

# Point Mutations

# First, the architecture.
# We have a class called DNA, initialized with a string representing DNA strand.
# It has an instance method `hamming_distance`, which is passed a string of a
#   separate DNA strand, and returns an integer.

# P
#   Calculate the number of differences between two strings.
#   If the strings are not the same length, compare up to the length of the
#     shorter string.
# examples in test cases
# data: DNA Class, strings may be converted into an array of characters.
# A
#   Initialize a local variable, hamming_distance, at 0.
#   Iterate from zero to the length of the shortest string - 1. On each number,
#     if the characters are not the same, add one to hamming_distance.
#   Return hamming_distance.
# C

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(evolved)
    hamming_distance = 0
    far = [@strand, evolved].min_by(&:length).length - 1
    (0..far).each { |idx| hamming_distance += 1 if @strand[idx] != evolved[idx] }
    hamming_distance
  end
end
