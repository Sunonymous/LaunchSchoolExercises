# Scrabble Score

# Architecture:
# Scrabble is a class which accepts a word in its constructor to score.
# It contains an instance method, Scrabble#score, which returns an integer score

# P
#   Score a word based on simple Scrabble rules. Each letter has a different
#     point value, and all letter's point values are summed.
# examples in test cases
# data: classes and hash
# A
#   Initialize an integer variable, results, at 0.
#   Separate the word into an array of letters and iterate over it.
#   On each, reference an array of hash keys (which are, themselves, arrays).
#     If a key contains the letter, add the value in the hash at that array key.
#   Return results.
# C

class Scrabble
  attr_reader :score

  # rubocop:disable Style/ClassVars, Style/WordArray, Layout/HashAlignment
  @@score_key = {
    ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
    ['D', 'G']                                         => 2,
    ['B', 'C', 'M', 'P']                               => 3,
    ['F', 'H', 'V', 'W', 'Y']                          => 4,
    ['K']                                              => 5,
    ['J', 'X']                                         => 8,
    ['Q', 'Z']                                         => 10
  }
  # rubocop:enable Style/ClassVars, Style/WordArray, Layout/HashAlignment

  def initialize(word)
    word ||= ''
    @word = word.upcase
    @score = Scrabble.score(@word)
  end

  def self.score(word)
    letters = word.upcase.chars
    points = 0
    letters.each do |letter|
      @@score_key.each_key do |group|
        points += @@score_key[group] if group.include?(letter)
      end
    end
    points
  end
end
