# Anagrams

# First, architecture.
# Anagram is a class which accepts a string in its constructor to represent the
#   word to compare against.
#   It has an instance method Anagram#match, which accepts an array of strings
#     to compare against the reference word, and returns an array of valid
#     anagrams. If there are no valid anagrams, an empty array is returned.

# P
#   Process a list of words against a reference word to filter out which words
#     are anagrams of the original reference word.
#   Exact matches are not considered anagrams.
#   If there are no matches, an empty array should be returned.
# examples in test file
# data: classes and arrays
# A
#   We are going to rely heavily on Array#sort (and String#<=>) for this one.
#   We need to equalize case. Downcase the given reference word on initialize.
#   Save a copy of the sorted characters in an instance variable, @chars.
#   Create an empty results array.
#   For each word in the list, compare sorting its characters with @chars.
#     If they match, append it to results.
#   Return results.
# C

class Anagram
  attr_accessor :reference, :chars

  def initialize(reference)
    @reference = reference.downcase
    @chars = @reference.chars.sort
  end

  def match(array)
    results = []
    array.each do |word|
      different_word  = (word.downcase != @reference)
      character_match = (word.downcase.chars.sort == @chars)
      results << word if different_word && character_match
    end
    results
  end
end
