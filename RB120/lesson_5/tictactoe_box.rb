# Tic Tac Toe, GameBox Edition

# TODO
# Square colors and highlights and lowercase

class String
  def red;           "\e[31;47m#{self}\e[0m" end
  def black;         "\e[30;47m#{self}\e[0m" end
end


require_relative 'gamebox.rb'

# Inherits Reminder
# Display  - clear_screen
#            wait_until_enter
#            message(msg, wait=false)
#            update(msg, wait=false)
#            choice_box(msg, wait=false)
#            notice(msg)
# Settings - get(name)
#            set(name)
#            make(name, display_name, value, range, display_vals=nil)
# Input    - get_str_choice(msg, prompt=)
#            get_choice(msg, options)
#            replace_with_choice(msg, options)
#            get_within_range(range, prompt=)
# GameBox  -
#            @width
#            @end_conditions
#            @winner
#            @game_over
#            @updates
#            @update_delay

start_width = 80
SETTINGS = Settings.new(start_width)

class Square
  @@rows = {
    '$' => ['     ', '     ', '     ', '     ', '     '],
    'A' => [' AAA ', 'A   A', 'AAAAA', 'A   A', 'A   A'],
    'B' => ['BBBB ', 'B   B', 'BBBB ', 'B   B', 'BBBB '],
    'C' => [' CCCC', 'C    ', 'C    ', 'C    ', ' CCCC'],
    'D' => ['DDDD ', 'D   D', 'D   D', 'D   D', 'DDDD '],
    'E' => ['EEEEE', 'E    ', 'EEE  ', 'E    ', 'EEEEE'],
    'F' => ['FFFFF', 'F    ', 'FFF  ', 'F    ', 'F    '],
    'G' => [' GGGG', 'G    ', 'G GGG', 'G   G', ' GGG '],
    'H' => ['H   H', 'H   H', 'HHHHH', 'H   H', 'H   H'],
    'I' => ['IIIII', '  I  ', '  I  ', '  I  ', 'IIIII'],
    'J' => [' JJJJ', '   J ', '   J ', 'J  J ', ' JJ  '],
    'K' => ['K   K', 'K  K ', 'KKK  ', 'K  K ', 'K   K'],
    'L' => ['L    ', 'L    ', 'L    ', 'L    ', 'LLLLL'],
    'M' => ['M   M', 'MM MM', 'M M M', 'M   M', 'M   M'],
    'N' => ['N   N', 'NN  N', 'N N N', 'N  NN', 'N   N'],
    'O' => [' OOO ', 'O   O', 'O   O', 'O   O', ' OOO '],
    'P' => ['PPPP ', 'P   P', 'PPPP ', 'P    ', 'P    '],
    'Q' => [' QQQ ', 'Q   Q', 'Q Q Q', 'Q  Q ', ' QQ Q'],
    'R' => ['RRRR ', 'R   R', 'RRRR ', 'R   R', 'R   R'],
    'S' => [' SSSS', 'S    ', ' SSS ', '    S', 'SSSS '],
    'T' => ['TTTTT', '  T  ', '  T  ', '  T  ', '  T  '],
    'U' => ['U   U', 'U   U', 'U   U', 'U   U', ' UUU '],
    'V' => ['V   V', 'V   V', 'V   V', ' V V ', '  V  '],
    'W' => ['W   W', 'W   W', 'W W W', 'WW WW', 'W   W'],
    'X' => ['X   X', ' X X ', '  X  ', ' X X ', 'X   X'],
    'Y' => ['Y   Y', 'Y   Y', ' YYY ', '  Y  ', '  Y  '],
    'Z' => ['ZZZZZ', '   Z ', '  Z  ', ' Z   ', 'ZZZZZ']
  }

  def initialize
    validate_rows
  end

  def row
    @@rows
  end

  def line(mark, line)
    @@rows[mark][line]
  end

  def full_square(mark)
    @@rows[mark].join("\n").downcase
  end

  def blank(square, line)
    mid = SETTINGS.get(:number_blank_squares) ? square : ' '
    rows = ['     ', '     ', "  #{mid}  ", '     ', '     ']
    rows[line]
  end

  def validate_rows
    @@rows.values do |row|
      row.each do |line|
        if line.length != 5
          raise Exception.new("Row #{row} has an invalid length.")
        end
      end
    end
  end
end

class Board
  attr_reader :square, :data

  def initialize(width)
    @width = width
    @vert_div = " \u2502 "
    @hori_div = "\u2500"
    @intersect = "\u253C"
    @data = [nil, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @square = Square.new
  end

  def clone_data
    @data = @data.clone
  end

  def mark_square(square, mark)
    @data[square] = mark
  end

  def piece_at(square)
    @data[square]
  end

  def open_squares
    (1..9).to_a.select { |square| @data[square] == ' ' }
  end

  def horizontal_line
    line = @hori_div
    plus = @intersect
    "#{line * 6}#{plus}#{line * 7}#{plus}#{line * 6}".center(@width)
  end

  def get_fragment(square_num, row)
    mark = piece_at(square_num)
    if mark == ' '
      square.blank(square_num, row)
    else
      square.line(mark, row)
    end
  end

  def print_row(row_num)
    squares = [1, 2, 3].map { |square| square + (3 * (row_num - 1)) }
    lines = []
    0.upto(4) do |row|
      full_line = ''
      full_line << get_fragment(squares[0], row) << @vert_div <<
        get_fragment(squares[1], row) << @vert_div <<
        get_fragment(squares[2], row)
      lines << full_line
    end
    lines.each { |line| puts line.center(@width) }
  end

  def space_separator
    "#{@hori_div * @width}\n\n\n"
  end

  def print_board
    puts space_separator
    1.upto(2) { |row| print_row(row) ; puts horizontal_line }
    print_row(3)
    puts "\n\n"
    puts space_separator
    ''
  end

  def to_s
    print_board
  end
end

class BoardReader
  attr_reader :board, :winner, :state, :score, :one_gap

  include Comparable

  def initialize(board, piece)
    @track_piece = piece
    @board = board
    @state = {}
    @full = false
    @lines = []
    @one_gap = []
    @two_gap = []
    @winner = nil
    @center_piece = ' '
    @score = nil
    update
  end

  def <=>(other_reader)
    self.score <=> other_reader.score
  end

  def empty?
    board.data.count(' ') == 9
  end

  def line_indexes
    [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7], [1, 4, 7],
     [2, 5, 8], [3, 6, 9]]
  end

  def add(state)
    @state.push(state)
  end

  def reset_containers
    @state.clear
    @one_gap.clear
    @two_gap.clear
  end

  def report
    lines = []
    lines << "State: #{@state}"
    lines << "Lines: #{@lines}"
    lines << "One Gap Lines: #{@one_gap}"
    lines << "Two Gap Lines: #{@two_gap}"
    lines << "Center Piece: #{@center_piece}"
    lines << "Winner: #{@winner}"
    lines << "Score: #{score}"
    puts lines.join("\n")
  end

  def update
    reset_containers
    if full?
      @full = true
      @winner = 'tie'
    end
    check_lines
    calculate_score
    @center_piece = board.piece_at(5) if @center_piece == ' '
  end

  def calculate_score
    @score = 0
    @score += (@two_gap.size) if @two_gap
    @score += (@one_gap.size * 2) if @one_gap
  end

  def marks_in_line(line)
    line.map { |square| @board.data[square] }
  end

  def first_gap_in_line(line)
    gaps = line.select { |square| @board.data[square] == ' ' }
    gaps.first
  end

  def full?
    board.data.none?(' ')
  end

  def valid_line?(marks)
    if marks.none?(' ') && marks.uniq.size == 1
      @winner = marks.first
      true
    end
    false
  end

  def check_lines
    line_indexes.each do |line|
      marks = marks_in_line(line)
      @lines.push(line) if valid_line?(marks)
      @one_gap.push(line) if one_gap?(marks)
      @two_gap.push(line) if two_gap?(marks)
    end
    set_empty_to_nil
  end

  def set_empty_to_nil
    @lines = @lines.empty? ? nil : @lines
    @one_gap = @one_gap.empty? ? nil : @one_gap
    @two_gap = @two_gap.empty? ? nil : @two_gap
  end

  def one_gap?(marks)
    marks.count(' ') == 1 && marks.count(@track_piece) == 2
  end

  def two_gap?(marks)
    marks.count(' ') == 2 && marks.count(@track_piece) == 1
  end

  def any_one_gap_lines?
    @one_gap.nil? ? false : !@one_gap.empty?
  end
end

class AI
  attr_reader :my_piece, :opponent, :chosen_space

  def initialize(board, piece, opponent, difficulty)
    @moves = []
    @my_piece = piece
    @opponent = opponent
    @board = board
    assign_moves(difficulty) # 0-2
    @chosen_space = nil
    select_space
  end

  private

  def assign_moves(difficulty)
    possible_moves= [
      ['random'],
      ['block_opponent', 'random'],
      ['take_center', 'take_win', 'block_opponent', 'find_best_move']
    ]
    @moves = possible_moves[difficulty]
  end

  def select_space
    @moves.each do |move|
      eval("self.#{move}")
      break unless @chosen_space.nil?
    end
  end

  def random
    @chosen_space = @board.open_squares.sample
    puts "i have chosen randomly square #{@chosen_space}" if DEBUG && @chosen_space
  end

  def block_opponent
    op_reader = BoardReader.new(@board, opponent)
    if op_reader.any_one_gap_lines?
      line = op_reader.one_gap.first
      gap = op_reader.first_gap_in_line(line)
      @chosen_space = gap
    end
    puts "I have decided to block my opponent at #{@chosen_space}" if DEBUG && @chosen_space
  end

  def take_center
    @chosen_space = 5 if @board.piece_at(5) == ' '
    puts "I have taken the center square" if DEBUG && @chosen_space
  end

  def take_win
    reader = BoardReader.new(@board, my_piece)
    if reader.any_one_gap_lines?
      one_gap_line = reader.one_gap.first
      gap = reader.first_gap_in_line(one_gap_line)
      @chosen_space = gap
    end
    puts "I decided to win with square #{@chosen_space}" if DEBUG && @chosen_space
  end

  def find_best_move
    open_squares = @board.open_squares
    ratings = open_squares.map do |sq|
      new_b = @board.clone
      new_b.clone_data
      new_b.mark_square(sq, my_piece)
      read = BoardReader.new(new_b, my_piece).score
    end
    @chosen_space = open_squares.select do |square|
      ratings[open_squares.index(square)] == ratings.max
    end.sample
    puts "I've considered all moves and chosen #{chosen_space}" if DEBUG && @chosen_space
  end
end

class TicTacToe < GameBox
  attr_reader :board

  def initialize(width)
    @width = width
    @end_conditions = []
    @game_over = false
    @winner = nil
    @board = Board.new(width)
  end
end

SETTINGS.make(:console_width, 'Game Width', 80, 50..100)
SETTINGS.make(:number_blank_squares, 'Number Empty Squares', true, true, Setting::YESNO)
SETTINGS.make(:player_1_shape, 'Player 1 Shape', 'X', 'A'..'Z')
SETTINGS.make(:player_2_shape, 'Player 2 Shape', 'O', 'A'..'Z')
SETTINGS.make(:player_1_name, 'Player 1 Name', 'Player', 'str')
SETTINGS.make(:player_2_name, 'Player 2 Name', 'Computer', 'str')
SETTINGS.make(:player_1_human, 'Player 1 is Human', true, true, Setting::YESNO)
SETTINGS.make(:player_2_human, 'Player 2 is Human', false, true, Setting::YESNO)
SETTINGS.make(:wins_needed, 'Wins Needed', 3, 1..50)

loop do
  # Main Menu
  Display.notice("Welcome to...\u2317  Tic Tac Toe \u2317")
  menu_options = %w(p play s settings q quit)
  choice = get_choice('Please choose from the following:', menu_options)
  case choice
  when 's', 'settings' then SETTINGS.menu
  when 'q', 'quit' then break
  when 'p', 'play'
    game = TicTacToe.new(SETTINGS.get(:console_width))
    game.play
  end
end

# game = TicTacToe.new(SETTINGS.get(:console_width))
# puts game.board
# debug
# x_turn = true
# DEBUG = true
# s = Square.new
# ('A'..'Z').each { |letter| puts s.full_square(letter); puts }
# gets
# loop do
  # game.clear_screen
  # puts game.board
  # state = BoardReader.new(game.board, 'O')
  # break if state.winner || state.state.include?('full')
  # state.report
  # piece = x_turn ? SETTINGS.get(:player_1_shape) : SETTINGS.get(:player_2_shape)
  # if x_turn
    # ai = AI.new(game.board, SETTINGS.get(:player_1_shape), SETTINGS.get(:player_2_shape), 2)
    # game.board.mark_square(ai.chosen_space, piece)
  # else
    # ai = AI.new(game.board, SETTINGS.get(:player_2_shape), SETTINGS.get(:player_1_shape), 2)
    # game.board.mark_square(ai.chosen_space, piece)
  # end
  # x_turn = !x_turn
  # gets
# end
