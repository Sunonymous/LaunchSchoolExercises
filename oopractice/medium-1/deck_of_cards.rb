# Deck of Cards

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = []
    make_new_deck
    shuffle_deck!
  end
  
  def draw
    card = @cards.pop
    make_new_deck if @cards.empty?
    card
  end

  private

  def make_new_deck
    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards.push(Card.new(rank, suit))
      end
    end
  end

  def shuffle_deck!
    @cards.shuffle!
  end
end

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

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
