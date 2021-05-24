# Twenty-One
# Forecasted Settings:
#   Show Hand Value on Each Turn
#   Use numerical values for card display values
#   Show dealer's hidden card on player bust
# TODO
# Extract Game Flow Methods
#   - Study what is repeated and see if it can be refactored
# Remove CARD_POINTS and use the LS calculation method
# Create screen/turn drawing method
# Colorize Cards!
# Cache Value of Hand Totals Upon Each New Card
# Make Tournament Style
# Create GOAL_POINTS and DEALER_STOPPOINT constants
# Sleep to simulate card flipping
# Print line after value printing

## CONSTANTS
GAME_WIDTH = 60
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
  until number_of_aces == 0 || total_points <= 21
    total_points -= 10 if total_points > 21
    number_of_aces -= 1
  end
  total_points
end

def draw_and_display_card!(player, deck, hand)
  deal_new_card!(deck, hand)
  new_card = display_card(hand.last)
  prompt_update("#{player} drew the card: #{new_card}.")
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
  puts "\nPress enter to continue...\n"
  gets
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
  puts "\nPress enter to continue..."
  gets
  clear_screen
end

########
##### DATA

def display_card(card_str)
  value = DISPLAY_VALUES[get_card_val(card_str)]
  suit = DISPLAY_SUITS[get_suit_val(card_str)]
  "#{value} of #{suit}"
end

def display_hand(hand, hidden=[])
  hand.each_with_index do |card, idx|
    card = hidden.include?(idx) ? '[HIDDEN]' : display_card(card)
    puts "#{card}".center(GAME_WIDTH)
  end
end

#######################
##### GAME FLOW METHODS
#

def initial_deal!(deck, player_hand, dealer_hand)
  2.times { deal_new_card!(deck, player_hand) }
  2.times { deal_new_card!(deck, dealer_hand) }
end

def show_hand(name, hand, hidden_cards=[])
  puts "#{name}'s Hand:\n".center(GAME_WIDTH)
  display_hand(hand, hidden_cards)
  puts
end

def get_dealer_action(hand)
  points = calculate_hand_value(hand)
  if points > 21
    'bust'
  elsif points >= 17
    'stay'
  else
    'hit'
  end
end

def recycle_cards_into_deck(active_cards, deck)
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
next_phase('Welcome to Twenty-One!')

deck = create_deck
shuffle_deck!(deck)

loop do
  cards_in_play = {
    dealer_hand: [],
    player_hand: []
  }
  initial_deal!(deck, cards_in_play[:player_hand], cards_in_play[:dealer_hand])

  # PLAYER TURN
  game_state = 'player_turn'
  loop do
    clear_screen
    prompt_box('Player\'s Turn')
    # EXTRACT to show_all_cards
    show_hand('Player', cards_in_play[:player_hand])
    print_hand_separator
    show_hand('Dealer', cards_in_play[:dealer_hand], [1])
    case game_state
    when 'dealer_win'
      prompt_update('Player has busted!')
      wait_until_enter
      break
    when 'dealt_card'
      draw_and_display_card!('Player', deck, cards_in_play[:player_hand])
      player_points = calculate_hand_value(cards_in_play[:player_hand])
      game_state = player_points > 21 ? 'dealer_win' : 'player_turn'
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
  loop do
    clear_screen
    dealer_action = nil
    case game_state
    when 'dealer_win'
      break
    when 'dealer_turn'
      prompt_box('Dealer\'s Turn')
    # EXTRACT to show_all_cards
      show_hand('Player', cards_in_play[:player_hand])
      print_hand_separator
      show_hand('Dealer', cards_in_play[:dealer_hand])
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
      draw_and_display_card!('Dealer', deck, cards_in_play[:dealer_hand])
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
  player_points = calculate_hand_value(cards_in_play[:player_hand])
  dealer_points = calculate_hand_value(cards_in_play[:dealer_hand])
  game_state = player_points == dealer_points ? 'draw' : game_state
  case game_state
  when 'player_win' then winner = 'Player'
  when 'dealer_win' then winner = 'Dealer'
  when 'draw' then prompt_box('It\'s a draw!')
  when 'calculate_winner'
    winner = player_points > dealer_points ? 'Player' : 'Dealer'
  end
  prompt_box("#{winner} is the winner!") if game_state != 'draw'
  show_hand('Player', cards_in_play[:player_hand])
  # EXTRACT to display_value
  puts "\t\t\tValue: #{player_points} points".center(GAME_WIDTH)
  puts
  show_hand('Dealer', cards_in_play[:dealer_hand])
  puts "\t\t\tValue: #{dealer_points} points".center(GAME_WIDTH)
  wait_until_enter

  # PLAY AGAIN?
  clear_screen
  puts "\n" * 5
  play_again = prompt_choice('Would you like to play again?', %w(yes y no n))
  if play_again.start_with?('y')
    recycle_cards_into_deck(cards_in_play, deck)
    next
  end
  break
end

next_phase('Thank you for playing!')
