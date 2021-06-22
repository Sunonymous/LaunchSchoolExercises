# Rock, Paper, Scissors

class Player
  attr_accessor :selection, :name

  def initialize(player_type)
    @player_type = player_type
    @selection = nil
    set_name
  end
end

class Human < Player
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

  def select
    print "Please choose: rock, paper, or scissors:\n\t>> "
    choice = nil
    loop do
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      print "Please make a valid selection.\n\t>> "
    end
    self.selection = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    @name = ['Computinator', 'xxXRPSChamp99Xx', 'BotTrotter'].sample
  end

  def select
    self.selection = Move.new(Move::VALUES.sample)
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors']
  def initialize(value)
    @value = value
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

  def matches(other_move)
    @value == other_move.value
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  protected

  attr_reader :value
end

class Rule
  def initialize
    # state?
  end
end

# --- Engine ---

class RockPaperScissors
  attr_accessor :human, :computer
  attr_reader :game_name

  def initialize
    @game_name = 'Rock, Paper, Scissors 2.0'
    @human = Human.new(:human)
    @computer = Computer.new(:computer)
  end

  def greet
    system('clear')
    puts "Welcome to #{game_name}!"
    puts "Press enter to begin!"
    gets
  end

  def dismiss
    puts "Thank you for playing #{game_name}!"
  end

  def display_moves
    puts "#{human.name} chose #{human.selection}."
    puts "#{computer.name} chose #{computer.selection}."
    puts
  end

  def display_winner
    if human.selection > computer.selection
      text = "#{human.name} wins!"
    else
      text = "#{computer.name} wins!"
      text = "It's a tie..." if human.selection.matches(computer.selection)
    end
    puts text
    puts
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

  def play
    greet
    loop do
      system('clear')
      human.select
      computer.select
      display_moves
      display_winner
      break unless play_again?
    end
    dismiss
  end
end

# --- GoTime ---
RockPaperScissors.new.play
