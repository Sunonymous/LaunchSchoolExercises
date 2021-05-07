# Rock, Paper, Scissors!
#
VALID_CHOICES = %w(rock paper scissors)
VALID_CHOICES_RPSLS = %w(rock paper scissors lizard spock)
VALID_SHORTHAND = %w(r p s)
VALID_SHORTHAND_RPSLS = %w(r p sc l sp)

def offer_choices(extended=false)
  prompt("Please select from the following choices:")
  if extended
    VALID_CHOICES_RPSLS.each_with_index do |choice, idx|
      puts "-- #{choice} (#{VALID_SHORTHAND_RPSLS[idx]})"
    end
  else
    VALID_CHOICES.each_with_index do |choice, idx|
      puts "-- #{choice} (#{VALID_SHORTHAND[idx]})"
    end
  end
end

def convert_shorthand(play)
  options = {
    'r' => 'rock',
    'p' => 'paper',
    'sc' => 'scissors',
    'l' => 'lizard',
    'sp' => 'spock',
    's' => 'scissors'
  }
  options[play]
end

def calculate_winner(player, computer)
  return 'tie' if player == computer
  match = {
    'rock' => ['lizard', 'scissors'],
    'lizard' => ['paper', 'spock'],
    'spock' => ['rock', 'scissors'],
    'scissors' => ['paper', 'lizard'],
    'paper' => ['rock', 'spock']
  }
  return 'win' if match[player].include?(computer)
  'lose'
end

def display_results(result)
  win_string = case result
               when 'win'
                 "You won!"
               when 'lose'
                 "You have lost."
               when 'tie'
                 "The match is a stalemate."
               end
  prompt(win_string)
end

def prompt(message)
  puts "=> #{message}"
end

def select_version
  prompt("Would you like to play the extended version?")
  print("-- 1) Yes I would.\n-- 2) No, thank you.\n>> ")
  selection = nil
  loop do
    selection = gets.chomp
    break if selection == '1' || selection == '2'
    print("Please enter 1 or 2 for your choice.\n>> ")
    next
  end
  selection == '1'
end

def add_point(scores, outcome)
  # outcome is from player's POV
  if outcome == 'win'
    scores[0] += 1
  elsif outcome == 'lose'
    scores[1] += 1
  end
  scores
end

def announce_winner(scores)
  winners = ['Mighty Player', 'Sturdy Computer']
  winner = winners[scores.index(3)]
  prompt("The winner is... The #{winner}! Congratulations!")
end

###########################################
prompt("Welcome to Rock, Paper, Scissors!")
extended_version = select_version

scores = [0, 0] # player first, always!
match_count = 1
loop do
  puts "\n\n\n"
  prompt("Round #{match_count}!")
  prompt("SCORES: Player (#{scores[0]}) --- Computer (#{scores[1]})")
  offer_choices(extended_version)
  choice = nil
  loop do
    choice = gets.chomp
    break if extended_version &&
             VALID_CHOICES_RPSLS.include?(choice) ||
             VALID_SHORTHAND_RPSLS.include?(choice)
    break if !extended_version &&
             VALID_CHOICES.include?(choice) ||
             VALID_SHORTHAND.include?(choice)
    print "I didn't understand your move. Please try again.\n>> "
  end

  choice = convert_shorthand(choice) if choice.length < 3

  computer_choice = VALID_CHOICES_RPSLS.sample
  computer_choice = VALID_CHOICES.sample unless extended_version

  prompt("You chose #{choice}. Computer chose #{computer_choice}.")

  outcome = calculate_winner(choice, computer_choice)
  scores = add_point(scores, outcome)
  display_results(outcome)

  game_over = scores.include?(3)
  if game_over
    announce_winner(scores)
    match_count = 0
  else
    next
  end

  prompt("Would you like to play again? (y/n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing!")
