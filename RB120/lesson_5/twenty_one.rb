# Twenty One, OOP Edition

# Reminders
# Change Deck::initialize to use keyword argument instead of default.

require_relative 'gamebox.rb'
GAME_WIDTH = 60
DEALER_STAY_VALUE = 17

class Card
  SUITS  = %w(S C H D)
  VALUES = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  POINTS = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
  VALUE_WIDE = 5
  SUIT_WIDE  = 8
  CARD_WIDTH = 20

  def initialize(value, suit)
    @value = value.to_s
    @suit  = suit.upcase
  end

  def value
    vals = %w(Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King)
    vals[VALUES.index(@value)]
  end

  def suit
    suits = %w(Spades Clubs Hearts Diamonds)
    suits[SUITS.index(@suit)]
  end

  def to_s
    "#{value.rjust(VALUE_WIDE)} of #{suit.ljust(SUIT_WIDE)}".center(CARD_WIDTH)
  end

  def points
    POINTS[VALUES.index(@value)]
  end
end

class Deck
  def initialize(auto_shuffle = true)
    @cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        @cards.push(Card.new(value, suit))
      end
    end
    shuffle_cards! if auto_shuffle
  end

  def shuffle_cards!(shuffles = 1)
    shuffles.times { @cards.shuffle! }
  end

  def deal_card
    @cards.shift
  end

  def replace_card(card)
    @cards.push(card)
  end
end

class Hand
  MAX_POINTS = 21

  def initialize
    @total = 0
    @cards = []
    update_total
  end

  def no_cards?
    @cards.empty?
  end

  def add_card!(card)
    @cards.push(card)
    update_total
  end

  def update_total
    @total = 0
    @cards.each { |card| @total += card.points }
    adjust_points_overflow
  end

  def busted?
    @total > MAX_POINTS
  end

  def show_first_card
    cards = [@cards.first, "(???)".center(Card::CARD_WIDTH)]
    cards.each { |card| puts card.to_s.center(GAME_WIDTH) }
  end

  def show_all_cards
    @cards.each { |card| puts card.to_s.center(GAME_WIDTH) }
  end

  def return_card!
    @cards.shift
  end

  def points
    @total
  end

  private

  def aces_in_hand
    @cards.select { |card| card.value == 'Ace' }.size
  end

  def adjust_points_overflow
    return if aces_in_hand == 0
    aces = aces_in_hand
    until @total <= MAX_POINTS || aces == 0
      @total -= 10
      aces -= 1
    end
  end
end

class TwentyOneGame
  attr_reader :io, :player, :dealer, :deck

  def initialize
    @player = Hand.new
    @dealer = Hand.new
    @deck   = Deck.new
    @io     = InputOutput.new(GAME_WIDTH)
  end

  def play
    hello
    loop do
      initial_deal
      game_flow
      break unless play_again?
      return_cards_to_deck
    end
    goodbye
  end

  private

  def hello
    io.clear_screen
    3.times { puts }
    puts Box.new(1, 'Welcome to Twenty-One!', GAME_WIDTH, 2)
    3.times { puts }
    io.wait_until_enter
  end

  def goodbye
    io.clear_screen
    3.times { puts }
    puts Box.new(4, 'Thank you for playing.', GAME_WIDTH, 2)
    3.times { puts }
  end

  def initial_deal
    2.times do
      player.add_card!(deck.deal_card)
      dealer.add_card!(deck.deal_card)
    end
  end

  def game_flow
    player_phase
    dealer_phase
    display_winner
  end

  def header(message)
    puts Box.new(4, message, GAME_WIDTH, 2)
    puts
  end

  def deal_new_card(hand)
    hand.add_card!(deck.deal_card)
  end

  def show_all_but_one_dealer_card
    puts "\tPlayer's Hand:"
    player.show_all_cards
    puts
    puts "\tDealer's Hand:"
    dealer.show_first_card
  end

  def clear_and_show_all_cards(heading = 'Results', show_points = false)
    io.clear_screen
    header(heading)
    puts "\tPlayer's Hand:"
    player.show_all_cards
    puts show_points ? "\n\tHand value: #{player.points}" : ''
    puts
    puts "\tDealer's Hand:"
    dealer.show_all_cards
    puts show_points ? "\n\tHand value: #{dealer.points}" : ''
    puts
  end

  def player_phase
    loop do
      io.clear_screen
      header("Player's Turn")
      show_all_but_one_dealer_card
      action = io.get_choice('What would you like to do?', %w(h hit s stay))
      %w(h hit).include?(action) ? deal_new_card(player) : break
      break if player.busted?
    end
  end

  def dealer_phase
    loop do
      break if player.busted?
      clear_and_show_all_cards('Dealer\'s Turn')
      break if dealer.busted? || dealer.points >= DEALER_STAY_VALUE
      deal_new_card(dealer)
      sleep(1)
    end
  end

  def evaluate_scores(p_points, d_points)
    if p_points > d_points
      puts 'You win!'.center(GAME_WIDTH)
    elsif d_points > p_points
      puts 'You lose!'.center(GAME_WIDTH)
    else
      puts 'It is a tie!'.center(GAME_WIDTH)
    end
  end

  def display_winner
    clear_and_show_all_cards('Results', true)
    puts
    if player.busted?
      puts "You have busted! You lose!".center(GAME_WIDTH)
    elsif dealer.busted?
      puts "Dealer has busted! You win!".center(GAME_WIDTH)
    else
      evaluate_scores(player.points, dealer.points)
    end
    io.wait_until_enter
  end

  def return_cards_to_deck
    deck.replace_card(player.return_card!) until player.no_cards?
    deck.replace_card(dealer.return_card!) until dealer.no_cards?
  end

  def play_again?
    3.times { puts }
    action = io.get_choice('Would you like to play again?', %w(y yes n no))
    %w(y yes).include?(action)
  end
end

t1 = TwentyOneGame.new
t1.play
