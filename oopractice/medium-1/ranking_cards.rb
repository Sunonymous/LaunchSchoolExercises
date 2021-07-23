# Highest and Lowest Ranking Cards

# P
#   Modify the class below so that the cards may be ranked.
#
#   Rules -
#     Ordering (from lowest to highest) is 2-10, J, Q, K, A.
#     Suits are irrelevant to rank.
#     Write a to_s method to display the cards as a string.
# E (below)
# D
#   An array will be used to hold the scores and reference for comparison.
# A
#   A constant array will be given containing nil, followed by the ranks of the
#     cards in scoring order from positive to negative.
#   This array will be used to reference the points available to each rank of
#     card, and subsequently used to sort based on this.
# C

class Card
  include Comparable

  attr_reader :rank, :suit

  VALUES = [nil, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace'].freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    VALUES.index(rank) <=> VALUES.index(other.rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
