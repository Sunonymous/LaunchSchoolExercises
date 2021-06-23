# Rock, Paper, Scissors

require 'pry-byebug'

SETTINGS = {
  num_rounds: 3,
  lizard_spock: false
}

class Player
  attr_accessor :selection, :name, :history

  def initialize
    @selection = nil
    @history = RecordBook.new
  end
end

class Human < Player
  def initialize
    super
    set_name
  end

  def set_name
    response = nil
    print "Please enter your name:\n\t>> "
    loop do
      response = gets.chomp
      break unless response.empty?
      print "Please enter any name:\n\t>> "
    end
    @name = response
  end

  def offer_options
    if SETTINGS[:lizard_spock]
      print "Choose: rock (r), paper (p), scissors (sc), lizard (l), spock (sp)"
      print "\n\t>> "
    else
      print "Please choose: rock (r), paper (p), or scissors (s):\n\t>> "
    end
  end

  def select
    Move.new('rock') # to refresh ls mode
    offer_options
    choice = nil
    loop do
      choice = gets.chomp.downcase
      break if Move.acceptable_input.include?(choice)
      print "Please make a valid selection.\n\t>> "
    end
    self.selection = Move.new(Move.parse_move(choice))
    @history.record_move(Move.parse_move(choice))
  end
end

class Computer < Player
  def initialize
    super
    set_name
  end

  def set_name
    @name = ['Computinator', 'xxxRPSChamp99Xx', 'BotTrotter'].sample
  end

  def select
    self.selection = Move.new(Move.options.sample)
    @history.record_move(selection.to_s)
  end
end

class Move
  attr_reader :value

  @@options = ['rock', 'paper', 'scissors']
  @@acceptable_input = ['r', 'rock', 'p', 'paper', 's', 'scissors']
  @@logic_wins = {
    'rock' => ['scissors', 'lizard'],
    'scissors' => ['paper', 'lizard'],
    'paper' => ['rock', 'spock'],
    'lizard' => ['spock', 'paper'],
    'spock' => ['scissors', 'rock']
  }
  @@logic_losses = {
    'rock' => ['paper', 'spock'],
    'scissors' => ['rock', 'spock'],
    'paper' => ['scissors', 'lizard'],
    'lizard' => ['rock', 'scissors'],
    'spock' => ['lizard', 'paper']
  }

  def initialize(value)
    @value = value
    enable_lizard_spock if SETTINGS[:lizard_spock]
  end

  def enable_lizard_spock
    @@options.push('lizard')
    @@options.push('spock')
    @@acceptable_input.push('sc')
    @@acceptable_input.push('sp')
    @@acceptable_input.push('l')
    @@acceptable_input.push('lizard')
    @@acceptable_input.push('spock')
    @@acceptable_input.delete('s')
  end

  def self.acceptable_input
    @@acceptable_input
  end

  def self.logic_wins
    @@logic_wins
  end

  def self.logic_losses
    @@logic_losses
  end

  def self.options
    @@options
  end

  def self.parse_move(input)
    case input
    when 'r' then 'rock'
    when 'p' then 'paper'
    when 's' then 'scissors'
    when 'sc' then 'scissors'
    when 'sp' then 'spock'
    when 'l' then 'lizard'
    else input
    end
  end

  def to_s
    @value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def wins?(other_move)
    @@logic_wins[@value].include?(other_move.value)
  end

  def loses?(other_move)
    @@logic_losses[@value].include?(other_move.value)
  end
end

class RecordBook
  def initialize
    @moves = {
      'rock' => 0,
      'paper' => 0,
      'scissors' => 0,
      'lizard' => 0,
      'spock' => 0
    }
  end

  def record_move(move)
    @moves[move] += 1
  end

  def display_record(name)
    puts "#{name} has played these moves:"
    @moves.each do |move, count|
      next if count == 0
      puts "\t#{move}: #{count} times"
    end
    puts
  end
end

class Tournament
  attr_reader :round

  def initialize(goal_wins, player1, player2)
    @goal = goal_wins
    @round = 0
    @scoreboard = {
      player1 => 0,
      player2 => 0
    }
  end

  def change_goal(new_goal)
    @goal = new_goal
  end

  def next_round
    @round += 1
  end

  def add_win(player)
    @scoreboard[player] += 1
  end

  def scores
    scores = @scoreboard.to_a
    p1_name = scores.first.first.name
    p1_wins = scores.first.last
    p2_name = scores.last.first.name
    p2_wins = scores.last.last
    "Scores:  #{p1_name} - #{p1_wins} | #{p2_name} - #{p2_wins}"
  end

  def tournament_over?
    !@scoreboard.values.select { |v| v >= @goal }.empty?
  end

  def grand_winner
    @scoreboard.select { |_, wins| wins >= SETTINGS[:num_rounds] }.first.first
  end
end

# --- Engine ---

class RockPaperScissors
  attr_accessor :human, :computer, :tournament
  attr_reader :game_name

  def initialize
    @game_name = 'Rock, Paper, Scissors 2.0'
    @human = Human.new()
    @computer = Computer.new()
    @tournament = Tournament.new(SETTINGS[:num_rounds], @human, @computer)
  end

  def big_box(message)
    puts "-" * 50
    puts "=== #{message} ===".center(50)
    puts "-" * 50
    puts
  end

  def stagger_print(message, delay)
    message.chars.each do |c|
      print c
      sleep(delay)
    end
  end

  def wait_for_enter
    puts "Press enter to continue..."
    gets
  end

  def greet
    system('clear')
    big_box("Welcome to #{game_name}!")
    wait_for_enter
  end

  def dismiss
    puts
    big_box("Thank you for playing #{game_name}!")
  end

  def display_round
    tournament.next_round
    message = "ROUND #{tournament.round}"
    big_box(message)
  end

  def display_moves
    puts "#{human.name} chose #{human.selection}."
    puts "#{computer.name} chose #{computer.selection}."
    puts
  end

  def evaluate_winner
    p1_move = @human.selection
    p2_move = @computer.selection
    if p1_move.wins?(p2_move)
      tournament.add_win(human)
      "#{human.name} wins!"
    elsif p1_move.loses?(p2_move)
      tournament.add_win(computer)
      "#{computer.name} wins!"
    else "It's a tie..."
    end
  end

  def display_winner
    big_box("RESULTS")
    puts evaluate_winner
    puts
    big_box(tournament.scores)
    puts
  end

  def display_grand_winner
    system('clear')
    big_box('TOURNAMENT COMPLETE')
    stagger_print("\tThe grand winner is", 0.1)
    stagger_print('...', 0.5)
    puts " #{tournament.grand_winner.name}!"
    sleep(0.5)
    puts
    big_box('Congratulations!')
    wait_for_enter
  end

  def take_turn
    display_round
    human.select
    computer.select
    display_moves
    display_winner
  end

  def play_again?
    print "Would you like to play again? (y/n)\n\t>> "
    choice = nil
    loop do
      choice = gets.chomp.downcase
      break if ['y', 'n'].include?(choice[0])
      print "Please enter y or n .\n\t>> "
    end
    choice[0] == 'y'
  end

  def game_loop
    loop do
      system('clear')
      take_turn
      wait_for_enter
      tournament.tournament_over? ? display_grand_winner : next
      break unless play_again?
      @tournament = Tournament.new(SETTINGS[:num_rounds], @human, @computer)
    end
  end

  def play
    greet
    game_loop
    dismiss
    human.history.display_record(human.name)
    computer.history.display_record(computer.name)
  end
end

# --- GoTime ---
RockPaperScissors.new.play
