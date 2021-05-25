# Twenty-One
# Forecasted Settings:
#   Use numerical values for card display values
# TODO
# Extract Game Flow Methods
#   - Study what is repeated and see if it can be refactored
# Remove CARD_POINTS and use the LS calculation method
# Create screen/turn drawing method
# Make Tournament Style
# Experiment with settings singleton
#   - create get_setting method to reach for the first element of a settings symbol

class String
  def red_card;           "\e[31;47m#{self}\e[0m" end
  def black_card;         "\e[30;47m#{self}\e[0m" end
end

## CONSTANTS
GAME_WIDTH = 60
GAME_NAME = 'Twenty-One'
POINT_LIMIT = 21
DEALER_STOPPOINT = 17
SUITS = %w(S H D C)
CARD_VALUES = %w(A 2 3 4 5 6 7 8 9 T J Q K)
CARD_POINTS = {
  'A' => 11,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'T' => 10,
  'J' => 10,
  'Q' => 10,
  'K' => 10
}
DISPLAY_SUITS = {
  'S' => 'Spades',
  'H' => 'Hearts',
  'D' => 'Diamonds',
  'C' => 'Clubs'
}
DISPLAY_VALUES = {
  'A' => 'Ace',
  '1' => 'One',
  '2' => 'Two',
  '3' => 'Three',
  '4' => 'Four',
  '5' => 'Five',
  '6' => 'Six',
  '7' => 'Seven',
  '8' => 'Eight',
  '9' => 'Nine',
  'T' => 'Ten',
  'J' => 'Jack',
  'Q' => 'Queen',
  'K' => 'King'
}

#######################
##### DATA METHODS
#

########
##### DECK

def create_deck
  CARD_VALUES.product(SUITS).map(&:join)
end

def shuffle_deck!(deck)
  deck.shuffle!(random: Random.new(rand(1..333)))
end

########
##### CARD

def get_suit_val(card_str)
  card_str.split('')[1]
end

def get_card_val(card_str)
  card_str.split('')[0]
end

def get_card_points(card_str)
  CARD_POINTS[get_card_val(card_str)]
end

########
##### HAND

def deal_new_card!(deck, hand)
  hand.push(deck.pop)
end

def calculate_hand_value(hand)
  total_points = 0
  number_of_aces = 0
  hand.each do |card|
    number_of_aces += 1 if card.include?('A')
    total_points += get_card_points(card)
  end
  until number_of_aces == 0 || total_points <= POINT_LIMIT
    total_points -= 10 if total_points > POINT_LIMIT
    number_of_aces -= 1
  end
  total_points
end

def draw_and_display_card!(player, deck, hand, colorize, points)
  deal_new_card!(deck, hand)
  update_player_points(points, player, hand)
  new_card = display_card(hand.last, colorize)
  prompt_update("#{player} drew the card: #{new_card}.")
end

def update_player_points(points, player, hand)
  points[player.to_sym] = calculate_hand_value(hand)
end

#######################
##### DISPLAY METHODS
#

def clear_screen
  system('clear')
end

def prompt(message)
  puts "~~> | #{message.center(GAME_WIDTH, ' ')} | <~~"
end

def prompt_box(message)
  puts "\u250C#{("\u2500" * (GAME_WIDTH - 2))}\u2510"
  puts "\u2502#{(' ' * (GAME_WIDTH - 2))}\u2502"
  puts "\u2502#{message.center(GAME_WIDTH - 2)}\u2502"
  puts "\u2502#{(' ' * (GAME_WIDTH - 2))}\u2502"
  puts "\u2514#{("\u2500" * (GAME_WIDTH - 2))}\u2518"
end

def prompt_update(message)
  puts "\u250C#{("\u2500" * (GAME_WIDTH - 2))}\u2510"
  puts "\u2502#{message.center(GAME_WIDTH - 2)}\u2502"
  puts "\u2514#{("\u2500" * (GAME_WIDTH - 2))}\u2518"
end

def next_phase(phase_name)
  clear_screen
  prompt_box(phase_name)
  wait_until_enter
  clear_screen
end

def print_hand_separator
    puts
    puts "~~~".center(GAME_WIDTH)
    puts
end

########
##### I/O

def prompt_choice(prompt, options)
  width = prompt.length
  lines = ["\u250C#{("\u2500" * (width))}\u2510",
           "\u2502#{prompt.center(width)}\u2502",   
           "\u2502#{options.join('/').center(width)}\u2502",
           "\u2514#{("\u2500" * (width))}\u2518",
           "\n"
  ]
  lines.each { |line| puts line.center(GAME_WIDTH) }
  loop do
    print("\t>> ")
    choice = gets.chomp.downcase
    return choice if options.include?(choice)
    puts 'Invalid response. Please try again.'
  end
end

def wait_until_enter
  puts
  print "Press enter to continue... ".center(GAME_WIDTH)
  gets
  clear_screen
end

########
##### DATA

def display_card(card_str, colorize)
  value = DISPLAY_VALUES[get_card_val(card_str)]
  suit = DISPLAY_SUITS[get_suit_val(card_str)]
  card = "#{value} of #{suit}".center(19)
  colorize ? colorize_card("[#{card}]") : "[#{card}]"
end

def colorize_card(card)
  red = card.include?('Hearts') || card.include?('Diamonds')
  if red
    card.red_card
  else
    card.black_card
  end
end
  
def display_hand(colorize, hand, hidden=[])
  hand.each_with_index do |card, idx|
    card = hidden.include?(idx) ? '[HIDDEN]' : display_card(card, colorize)
    puts "#{card}".center(GAME_WIDTH + 10)
  end
end

def display_hand_value(points, name)
  puts
  puts "\t\t\tValue: #{points[name.to_sym]} points".center(GAME_WIDTH)
end

#######################
##### GAME FLOW METHODS
#

def initial_deal!(deck, player_hand, dealer_hand)
  2.times { deal_new_card!(deck, player_hand) }
  2.times { deal_new_card!(deck, dealer_hand) }
end

def show_hand(points, settings, name, hand, hidden_cards=[])
  puts "#{name}'s Hand:\n".center(GAME_WIDTH)
  display_hand(settings[:colored_cards], hand, hidden_cards)
  if settings[:always_show_value]
    display_hand_value(points, name)
  end
  puts
end

def has_bust?(points, player)
  points[player.to_sym] > POINT_LIMIT
end

def get_dealer_action(hand)
  points = calculate_hand_value(hand)
  if points > POINT_LIMIT
    'bust'
  elsif points >= DEALER_STOPPOINT
    'stay'
  else
    'hit'
  end
end

def recycle_cards_into_deck!(active_cards, deck)
  cards = active_cards.values.flatten
  until cards.size == 0
    deck.unshift(cards.pop)
  end
end

#######################
###### GAME LOOP
#

clear_screen
game_state = 'menu'
next_phase("Welcome to #{GAME_NAME}!")

deck = create_deck
shuffle_deck!(deck)
settings = {
  colored_cards: true,
  always_show_value: true
}

loop do
  cards_in_play = {
    dealer_hand: [],
    player_hand: []
  }
  points = {
    Player: 0,
    Dealer: '?'
  }
  initial_deal!(deck, cards_in_play[:player_hand], cards_in_play[:dealer_hand])

  # PLAYER TURN
  game_state = 'player_turn'
  update_player_points(points, 'Player', cards_in_play[:player_hand])
  loop do
    clear_screen
    prompt_box('Player\'s Turn')
    # EXTRACT to show_all_cards
    show_hand(points, settings, 'Player', cards_in_play[:player_hand])
    print_hand_separator
    show_hand(points, settings, 'Dealer', cards_in_play[:dealer_hand], [1])
    case game_state
    when 'dealer_win'
      prompt_update('Player has busted!')
      wait_until_enter
      break
    when 'dealt_card'
      draw_and_display_card!(
        'Player',
        deck,
        cards_in_play[:player_hand],
        settings[:colored_cards],
        points
      )
      game_state = has_bust?(points, 'Player') ? 'dealer_win' : 'player_turn'
      wait_until_enter
      next
    when 'player_turn'
      player_choice =
        prompt_choice('Would you like to hit or stay?', %w(h hit s stay))
      game_state = 'dealt_card' if player_choice[0] == 'h'
      if player_choice[0] == 's'
        game_state = 'dealer_turn'
        break
      end
    end
  end

  # DEALER TURN
  update_player_points(points, 'Dealer', cards_in_play[:dealer_hand])
  loop do
    clear_screen
    dealer_action = nil
    case game_state
    when 'dealer_win'
      break
    when 'dealer_turn'
      prompt_box('Dealer\'s Turn')
    # EXTRACT to show_all_cards
      show_hand(points, settings, 'Player', cards_in_play[:player_hand])
      print_hand_separator
      show_hand(points, settings, 'Dealer', cards_in_play[:dealer_hand])
      dealer_action = get_dealer_action(cards_in_play[:dealer_hand])
    end

    case dealer_action
    when 'bust'
      prompt_update('Dealer busts!')
      game_state = 'player_win'
      wait_until_enter
      break
    when 'hit'
      prompt_update("Dealer must #{dealer_action}.")
      draw_and_display_card!(
        'Dealer',
        deck,
        cards_in_play[:dealer_hand],
        settings[:colored_cards],
        points
      )
      wait_until_enter
      next
    when 'stay'
      prompt_update("Dealer must #{dealer_action}.")
      game_state = 'calculate_winner'
      wait_until_enter
      break
    end
  end

  # ANNOUNCE WINNER
  winner = nil
  game_state = points[:Player] == points[:Dealer] ? 'draw' : game_state
  case game_state
  when 'player_win' then winner = 'Player'
  when 'dealer_win' then winner = 'Dealer'
  when 'draw' then prompt_box('It\'s a draw!')
  when 'calculate_winner'
    winner = points[:Player] > points[:Dealer] ? 'Player' : 'Dealer'
  end
  prompt_box("#{winner} is the winner!") if game_state != 'draw'
  show_hand(points, settings, 'Player', cards_in_play[:player_hand])
  # EXTRACT to display_value
  puts "\t\t\tValue: #{points[:Player]} points".
    center(GAME_WIDTH) unless settings[:always_show_value]
  puts
  show_hand(points, settings, 'Dealer', cards_in_play[:dealer_hand])
  puts "\t\t\tValue: #{points[:Dealer]} points".
    center(GAME_WIDTH) unless settings[:always_show_value]
  wait_until_enter

  # PLAY AGAIN?
  clear_screen
  puts "\n" * 5
  play_again = prompt_choice('Would you like to play again?', %w(yes y no n))
  if play_again.start_with?('y')
    recycle_cards_into_deck!(cards_in_play, deck)
    next
  end
  break
end

next_phase('Thank you for playing!')
