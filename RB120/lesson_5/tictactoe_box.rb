# Tic Tac Toe, GameBox Edition

# TODO
# Shift Mode / Dynamic Name of Game

require_relative 'gamebox.rb'

start_width = 80
SETTINGS = Settings.new(start_width) # singleton! yay!

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
      full_line << row_slice(squares, row)
      lines << full_line
    end
    lines.each { |line| puts line.center(@width) }
  end

  def row_slice(squares, idx)
    line = ''
    line << get_fragment(squares[0], idx) << @vert_div <<
      get_fragment(squares[1], idx) << @vert_div <<
      get_fragment(squares[2], idx)
    line
  end

  def space_separator
    "#{@hori_div * @width}\n\n\n"
  end

  # rubocop:disable Style/Semicolon
  def print_board
    puts space_separator
    1.upto(2) { |row| print_row(row); puts horizontal_line }
    print_row(3)
    puts "\n\n"
    puts space_separator
    ''
  end
  # rubocop:enable Style/Semicolon

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
    score <=> other_reader.score
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
    @lines = []
    @one_gap = []
    @two_gap = []
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
      return true
    end
    false
  end

  def any_lines?
    @lines.nil? ? false : true
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
    possible_moves = [
      ['random'],
      ['block_opponent', 'random'],
      ['take_center', 'take_win', 'block_opponent', 'find_best_move']
    ]
    @moves = possible_moves[difficulty]
  end

  def select_space
    @moves.each do |move|
      send(move)
      break unless @chosen_space.nil?
    end
  end

  def random
    @chosen_space = @board.open_squares.sample
  end

  def block_opponent
    op_reader = BoardReader.new(@board, opponent)
    return unless op_reader.any_one_gap_lines?
    line = op_reader.one_gap.first
    gap = op_reader.first_gap_in_line(line)
    @chosen_space = gap
  end

  def take_center
    @chosen_space = 5 if @board.piece_at(5) == ' '
  end

  def take_win
    reader = BoardReader.new(@board, my_piece)
    return unless reader.any_one_gap_lines?
    one_gap_line = reader.one_gap.first
    gap = reader.first_gap_in_line(one_gap_line)
    @chosen_space = gap
  end

  def find_best_move
    open_squares = @board.open_squares
    ratings = open_squares.map do |sq|
      new_b = @board.clone
      new_b.clone_data
      new_b.mark_square(sq, my_piece)
      BoardReader.new(new_b, my_piece).score
    end
    @chosen_space = open_squares.select do |square|
      ratings[open_squares.index(square)] == ratings.max
    end.sample
  end
end

class Tournament
  def initialize(wins_needed, player_one, player_two)
    @wins_needed = wins_needed
    @win_record = {}
    @win_record[player_one] = 0
    @win_record[player_two] = 0
  end

  def add_win(player)
    @win_record[player] += 1
  end

  def score(player)
    @win_record[player]
  end

  def finished?
    @win_record.each.any? { |name, wins| wins >= @wins_needed && name != 'tie' }
  end

  def grand_winner
    @win_record.keys.select { |name| @win_record[name] >= @wins_needed }.first
  end
end

class TicTacToe < GameBox
  attr_reader :board, :io, :state, :tournament

  # rubocop:disable Metrics/MethodLength
  def initialize(width)
    @width = width
    @game_over = false
    @winner = nil
    @board = Board.new(width)
    @state = BoardReader.new(board, '!')
    @io = InputOutput.new(width)
    @tournament = new_tournament
    @updates = []
    @update_delay = 0.25
    @end_conditions = [Proc.new { state.any_lines? }, Proc.new { state.full? }]
    @active_player = starting_player
  end
  # rubocop:enable Metrics/MethodLength

  def play_tournament
    loop do
      play
      tournament.add_win(@winner) if @winner != 'tie'
      break if tournament.finished?
      show_scores
      @board = Board.new(width)
      @state = BoardReader.new(board, '!')
    end
    announce_grand_winner
  end

  def play
    super
    @winner = winner_name_from_piece
    add_update(win_string)
    display_updates
  end

  private

  def show_scores
    io.clear_screen
    io.message('Here are the scores so far:')
    puts
    scoreboard = []
    2.times do |idx|
      name = SETTINGS.get("player_#{idx + 1}_name".to_sym)
      scoreboard.push("#{name}: #{tournament.score(name)}")
    end
    puts Box.new(1, scoreboard, width, 3)
    io.wait_until_enter
  end

  def announce_grand_winner
    name = tournament.grand_winner
    io.clear_screen
    5.times { puts }
    puts Box.new(4, "#{name} wins the tournament! Congratulations!", width, 3)
    io.wait_until_enter
  end

  def win_string
    @winner == 'tie' ? 'It was a tie!' : "#{@winner} has won the round!"
  end

  def starting_player
    SETTINGS.get(:player_1_starts) == true ? 1 : 2
  end

  def next_player
    next_p = @active_player + 1
    next_p > 2 ? 1 : next_p
  end

  def inactive_plyr_num
    @active_player == 1 ? 2 : 1
  end

  def active_player_info(trait)
    sym = "player_#{@active_player}_#{trait}".to_sym
    SETTINGS.get(sym)
  end

  def game_logic
    show_playing_field
    active_player_info('human') ? human_turn : auto_turn
    @state.update
    @active_player = next_player
  end

  def show_playing_field
    io.clear_screen
    puts board
  end

  def human_turn
    piece = active_player_info('shape')
    spc = io.replace_with_choice('Choose a square to mark:', board.open_squares)
    board.mark_square(spc, piece)
  end

  def auto_turn
    piece = active_player_info('shape')
    opponent_piece = SETTINGS.get("player_#{inactive_plyr_num}_shape".to_sym)
    difficulty = SETTINGS.get(:bot_difficulty)
    sleep(0.5) # for the feels
    ai = AI.new(board, piece, opponent_piece, difficulty)
    board.mark_square(ai.chosen_space, piece)
  end

  def new_tournament
    wins = SETTINGS.get(:wins_needed)
    p1 = SETTINGS.get(:player_1_name)
    p2 = SETTINGS.get(:player_2_name)
    Tournament.new(wins, p1, p2)
  end

  def winner_name_from_piece
    piece = state.winner
    return 'tie' if piece == 'tie'
    if active_player_info('shape') == piece
      active_player_info('name')
    else
      SETTINGS.get("player_#{inactive_plyr_num}_name".to_sym)
    end
  end
end

# Non-class methods

def blanks(count)
  count.times { puts }
end

# rubocop:disable Layout/LineLength, Metrics/MethodLength, Metrics/AbcSize
def instructions(width)
  system('clear')
  puts
  puts Box.new(4, "Here's how you play Tic Tac Toe:", width, 1)
  sleep(1.5)
  blanks(2)
  players = split_by_length("There are two players, each with a shape, traditionally", width - 4)
  players.each { |msg| puts msg.center(width) }
  sleep(2)
  puts
  s = Square.new
  puts Box.new(3, s.row['X'], 9).lines.map { |l| l.center(width) }.join("\n")
  sleep(0.75)
  puts
  puts "or".center(width)
  puts
  sleep(0.75)
  puts Box.new(3, s.row['O'], 9).lines.map { |l| l.center(width) }.join("\n")
  sleep(1.75)
  playing_field = split_by_length('The playing field is a three by three grid, like this:', width - 4)
  puts Box.new(0, playing_field, width, 1)
  sleep(1.75)
  blanks(2)
  puts Board.new(width)
  sleep(2)
  player_moves = split_by_length('The players take turns putting their piece in an empty space on the grid. The goal is to get three of your own piece in a straight line horizontally, vertically, or diagonally.', width - 4)
  puts Box.new(0, player_moves, width, 1)
  # animate this
  sleep(3)
  puts
  end_conditions = split_by_length('The game ends when the grid is full or a player has made a line!', width - 4)
  puts Box.new(1, end_conditions, width)
  puts
  puts "* * * * *".center(width)
  puts
  shift_intro = split_by_length('Additionally, this program contains a version of the game called Shift Tac Toe, which can be enabled in the settings.', width - 4)
  puts Box.new(0, shift_intro, width)
  sleep(3)
  shift_instructions = split_by_length("The rules and goal of Shift Tac Toe are the same as the original game. The primary difference is that all tiles on the board are occasionally /shifted/ up, down, left, or right! This keeps the players constantly on alert\u2014I hope you're paying attention!", width - 4)
  puts Box.new(1, shift_instructions, width, 1)
  sleep(4)
  puts Box.new(4, 'All clear? Let\'s get started!', width)
  InputOutput.new(width).wait_until_enter('(Press enter to return to the main menu.)')
end
# rubocop:enable Layout/LineLength, Metrics/MethodLength, Metrics/AbcSize

def split_by_length(string, wide)
  if string.length > wide
    lines = []
    line = ''
    add_until_past_width(string.split(' '), lines, line, wide)
    lines
  else
    [string]
  end
end

def add_until_past_width(words, lines, line, wide)
  loop do
    if !words.empty? && line.length + words.first.length <= wide
      line += "#{words.shift} "
    else
      lines << line
      line = ''
      break if words.empty?
    end
  end
end

def main_menu(width)
  menu = InputOutput.new(width)
  menu.clear_screen
  5.times { puts }
  puts Box.new(1, ["Welcome to", "\u2317  Tic Tac Toe \u2317"], width, 3)
  5.times { puts }
  menu_options = %w(p play i instructions s settings q quit)
  menu.get_choice('Please choose from the following:', menu_options)
end

def goodbye
  width = SETTINGS.get(:console_width)
  5.times { puts }
  thnx = ["Thank you for playing!", "\u2317  Tic Tac Toe \u2317  "]
  puts Box.new(1, thnx, width, 3)
  5.times { puts }
end

yn = Setting::YESNO
dlvl = ['Haybale', 'Distracted', 'Challenging']
SETTINGS.make(:console_width, 'Game Width', 80, 50..100)
SETTINGS.make(:number_blank_squares, 'Number Empty Squares', true, true, yn)
SETTINGS.make(:player_1_starts, 'Player 1 Starts Tournament', true, true, yn)
SETTINGS.make(:player_1_shape, 'Player 1 Shape', 'X', 'A'..'Z')
SETTINGS.make(:player_2_shape, 'Player 2 Shape', 'O', 'A'..'Z')
SETTINGS.make(:player_1_name, 'Player 1 Name', 'Player', 'str')
SETTINGS.make(:player_2_name, 'Player 2 Name', 'Computer', 'str')
SETTINGS.make(:player_1_human, 'Player 1 is Human', true, true, yn)
SETTINGS.make(:player_2_human, 'Player 2 is Human', false, true, yn)
SETTINGS.make(:bot_difficulty, 'Computer Difficulty Level', 2, [0, 1, 2], dlvl)
SETTINGS.make(:tournament_mode, 'Play a Tournament', false, true, yn)
SETTINGS.make(:wins_needed, 'Tournament Wins Needed', 3, 2..50)

loop do
  width = SETTINGS.get(:console_width)
  game = TicTacToe.new(width)
  case main_menu(width)
  when 'i', 'instructions' then instructions(width)
  when 's', 'settings' then SETTINGS.menu
  when 'q', 'quit' then break
  when 'p', 'play'
    SETTINGS.get(:tournament_mode) ? game.play_tournament : game.play
  end
end
system('clear')
goodbye
