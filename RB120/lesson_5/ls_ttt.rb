class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 6],
                   [3, 6, 9], [1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def draw
    puts "     |     |     "
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  "
    puts "     |     |     "
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def []=(square, mark)
    @squares[square].marker = mark
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_mark
  end

  def winning_mark
    WINNING_LINES.each do |line|
      mark = @squares[line.first].marker
      return mark if mark != Square::INITIAL_MARKER &&
                     line.map { |key| @squares[key].marker }.uniq.size == 1
    end
    nil
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end
end

class Square
  attr_accessor :marker

  INITIAL_MARKER = ' '

  def initialize
    @marker = INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker

  def initialize(mark)
    @marker = mark
  end
end

class TTTGame
  attr_reader :board, :human, :computer

  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @human_first = false
    @human_turn = @human_first
  end

  def play
    hello
    loop do
      display_board
      game_loop
      display_result
      break unless play_again?
      reset_game
    end
    display_goodbye_message
  end

  private

  def game_loop
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board
    end
  end

  def hello
    clear
    display_welcome_message
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!\n"
  end

  def clear
    system('clear')
  end

  def human_moves
    puts "Choose a square between (#{board.unmarked_keys.join(', ')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that is not a valid choice."
    end
    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def current_player_moves
    @human_turn ? human_moves : computer_moves
    @human_turn = !@human_turn
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Please enter y or n."
    end
    answer == 'y'
  end

  def display_goodbye_message
    puts "Goodbye!"
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_mark
    when HUMAN_MARKER then puts "You win!"
    when COMPUTER_MARKER then puts "You lose!"
    else puts "The board is full!"
    end
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def reset_game
    board.reset
    @human_turn = @human_first
    system('clear')
    puts "Let's play again!\n"
  end

  def display_board
    puts "You are a #{human.marker}. Computer is the #{computer.marker}"
    puts
    board.draw
    puts
  end
end

game = TTTGame.new
game.play
