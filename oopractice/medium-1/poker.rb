# Poker

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

class PokerHand
  def initialize(deck)
    @cards = []
    5.times { @cards.push(deck.draw) }
    @runs = build_possible_runs
    @ranks = build_rank_list
    @rank_count = build_rank_count_hash
    @suits = build_suit_list
    @suit_count = build_suit_count_hash
  end

  def print
    @cards.each { |card| puts card }
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    sequence = [10, 'Jack', 'Queen', 'King', 'Ace']
    valid = true
    sequence.each { |rank| valid = false unless @ranks.include?(rank) }
    straight? && valid && @suits.size == 1
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    @rank_count.values.include?(4)
  end

  def full_house?
    @rank_count.values.include?(2) && @rank_count.values.include?(3)
  end

  def flush?
    @suits.size == 1
  end

  def straight?
    @runs.each do |run|
      valid = true
      run.each { |ranking| valid = false unless @ranks.include?(ranking) }
      return true if valid
    end
    false
  end

  def three_of_a_kind?
    @rank_count.values.include?(3)
  end

  def two_pair?
    @rank_count.values.count(2) == 2
  end

  def pair?
    @rank_count.values.include?(2)
  end

  def build_possible_runs
    runs = []
    index = 0
    until index == 9
      runs.push(Deck::RANKS.slice(index, 5))
      index += 1
    end
    runs
  end

  def build_rank_list
    list = []
    @cards.each { |card| list.push(card.rank) unless list.include?(card.rank) }
    list
  end

  def build_suit_list
    list = []
    @cards.each { |card| list.push(card.suit) unless list.include?(card.suit) }
    list
  end

  def build_rank_count_hash
    rank_count = Hash.new(0)
    Deck::RANKS.each do |rank|
      @cards.each { |card| rank_count[rank] += 1 if card.rank == rank }
    end
    rank_count
  end

  def build_suit_count_hash
    suit_count = Hash.new(0)
    Deck::SUITS.each do |suit|
      @cards.each { |card| suit_count[suit] += 1 if card.suit == suit }
    end
    suit_count
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
