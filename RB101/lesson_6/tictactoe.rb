require 'pry'
# TODO
# - disable  Metrics/CyclomaticComplexity on AI method
# - in refresh_screen method, add status bar with information
# - add help instructions
# - fix rubocop stuff

EMPTY_SPACE = ' '
GAME_PIECES = ['X', 'O']
WIN_MARKERS = ['🅇', '🄾']
WINNING_LINE_INDEXES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                        [1, 4, 7], [2, 5, 8], [3, 6, 9],
                        [1, 5, 9], [3, 5, 7]]
EMPTY_LINE = '   |   |   '
LINE_DIVIDER = '---+---+---'
CONSOLE_WIDTH = 60

##################################################
#      DISPLAY METHODS
##################################################

def prompt(msg)
  puts "~~> #{msg.center(CONSOLE_WIDTH, ' ')} <~~"
end

def print_blanks(num)
  num.times { puts }
end

def thought_box(msg, buffer: 5, clear_on_exit: true, use_gets: true)
  print_blanks(buffer)
  prompt('-' * msg.length)
  prompt(msg)
  prompt('-' * msg.length)
  print_blanks(buffer)
  prompt('Press enter to continue...') if use_gets
  gets if use_gets
  system('clear') if clear_on_exit
end

def display_menu_options(num_rounds)
  thought_box(
    "Welcome to Tic-Tac-Toe! First to #{num_rounds} points wins!",
    use_gets: false, clear_on_exit: false
  )
  prompt('To play with the current settings, type \'p\' or \'play\' .')
  prompt('To change the settings, type \'s\' or \'settings\' .')
  prompt('')
end

def refresh_screen(bd, data)
  system('clear')
  prompt('Game Start!') if get_empty_spaces(bd).size == 9
  display_board(bd, data[:marked_spaces] && (!data[:winner]))
end

def announce_score(data)
  prompt('Scores:')
  player = data[:player_piece]
  computer = data[:computer_piece]
  thought_box(
    "Player: #{data[:scores][player]} -- Computer: #{data[:scores][computer]}",
    buffer: 0, clear_on_exit: true
  )
end

def display_board(bd, marked=false)
  bd_cp = bd.dup
  if marked
    bd_cp.values.each_with_index do |mark, idx|
      bd_cp[idx + 1] = idx + 1 if mark == EMPTY_SPACE
    end
  end
  puts
  lines = [
    EMPTY_LINE,
    " #{bd_cp[1]} | #{bd_cp[2]} | #{bd_cp[3]} ",
    EMPTY_LINE, LINE_DIVIDER, EMPTY_LINE,
    " #{bd_cp[4]} | #{bd_cp[5]} | #{bd_cp[6]} ",
    EMPTY_LINE, LINE_DIVIDER, EMPTY_LINE,
    " #{bd_cp[7]} | #{bd_cp[8]} | #{bd_cp[9]} ",
    EMPTY_LINE
  ]
  lines.each { |line| puts line.center(60, ' ') }
  puts
end

def joinor(arr, join_str, and_or)
  return '' if arr.size < 1
  return arr.first if arr.size == 1
  first = arr[0..-2]
  last  = arr[-1]
  first.join(join_str) + "#{join_str}#{and_or} #{last}"
end

def announce_winner(data)
  winner_announcement = case data[:winner]
                        when data[:player_piece]
                          ' You\'ve won! Congratulations!'
                        when data[:computer_piece]
                          ' The computer has defeated you...'
                        else ' It was a draw!'
                        end
  prompt(winner_announcement)
end

##################################################
#      INITIALIZATION
##################################################

def create_new_board
  new_board = {}
  (1..9).each { |num| new_board[num] = EMPTY_SPACE }
  new_board
end

def initialize_game!(data, settings)
  data[:player_piece] = GAME_PIECES[0]
  data[:computer_piece] = GAME_PIECES[1]
  data[:player_win] = WIN_MARKERS[0]
  data[:computer_win] = WIN_MARKERS[1]
  update_setting_values!(data, settings)
end

def update_setting_values!(data, settings)
  settings.values.each do |setting|
    setting[:value] = data[(setting[:name])]
  end
end

def initialize_data
  {
    player_turn: true,
    winner: nil,
    grand_winner: nil,
    difficulty: 2, # 0haybale, 1distracted, 2challenging
    scores: { 'X' => 0, 'O' => 0, nil => 0 },
    player_piece: GAME_PIECES[0],
    computer_piece: GAME_PIECES[1],
    player_win: WIN_MARKERS[0],
    computer_win: WIN_MARKERS[1],
    number_of_rounds: 3,
    marked_spaces: false,
    quit_game: false
  }
end

def initialize_settings(data)
  {
    'difficulty' => {
      idx: 1,
      name: :difficulty,
      type: 'Integer',
      range: (0..2),
      desc: 'Level of Difficulty',
      value: data[:difficulty],
      display_value: ['0 (Haybale)', '1 (Distracted)', '2 (Challenging)'],
      range_display: '0, 1, or 2'
    },
    'number_of_rounds' => {
      idx: 2,
      name: :number_of_rounds,
      type: 'Integer',
      range: (1..50),
      desc: 'Number of Wins Needed',
      value: data[:number_of_rounds],
      range_display: '1 - 50'
    },
    'player_turn' => {
      idx: 3,
      name: :player_turn,
      type: 'Boolean',
      range: [true, false],
      desc: 'Player Starts First',
      value: data[:player_turn]
    },
    'player_piece' => {
      idx: 4,
      name: :player_piece,
      type: 'String',
      range: ['X', 'O'],
      desc: 'Player Uses the Piece',
      value: data[:player_piece]
    },
    'marked_spaces' => {
      idx: 5,
      name: :marked_spaces,
      type: 'Boolean',
      desc: 'Label Unmarked Spaces',
      value: data[:marked_spaces]
    }
  }
end

##################################################
#      BOARD DATA
##################################################

def get_empty_spaces(bd)
  bd.keys.select { |spc| bd[spc] == EMPTY_SPACE }
end

def find_onegap_row(bd)
  WINNING_LINE_INDEXES.select do |line|
    marks = get_marks(bd, line)
    marks.uniq.size == 2 && marks.count(EMPTY_SPACE) == 1
  end
end

def mark_last_in_row(bd, looking_for)
  options = find_onegap_row(bd)
  selection = nil
  options.each do |line|
    marks = get_marks(bd, line)
    if marks.include?(looking_for)
      selection = line[marks.index(EMPTY_SPACE)]
    end
  end
  selection
end

def get_marks(bd, indexes)
  marks = []
  indexes.each { |idx| marks << bd[idx] }
  marks
end

def check_for_winner(bd, data)
  WINNING_LINE_INDEXES.each do |line|
    marks = get_marks(bd, line)
    next if marks.include?(EMPTY_SPACE)
    if marks.uniq.size == 1
      highlight_winning_line!(bd, data, line, marks.first)
      return marks.first
    end
  end
  nil
end

def highlight_winning_line!(bd, data, line, winner)
  win_symbol =
    winner == data[:player_piece] ? data[:player_win] : data[:computer_win]
  line.each { |idx| bd[idx] = win_symbol }
end

def no_free_spaces?(bd)
  get_empty_spaces(bd).empty?
end

##################################################
#      TURN LOGIC
##################################################

def process_turn(bd, data)
  refresh_screen(bd, data)
  if data[:player_turn]
    player_turn!(bd, data)
  else
    computer_turn!(bd, data)
  end
  data[:player_turn] = !data[:player_turn]
  data[:winner] = check_for_winner(bd, data)
end

def player_turn!(bd, data)
  choice = ''
  space_options = get_empty_spaces(bd)
  loop do
    prompt('Please enter a space to mark.')
    prompt("Options are: (#{joinor(space_options, ', ', 'or')})")
    prompt('Not like there\'s much choice...') if space_options.size == 1
    print("\t>> ")
    choice = gets.chomp.to_i
    break if space_options.include?(choice)
    prompt('You have entered an invalid space. Please try again.')
  end
  bd[choice] = data[:player_piece]
end

def computer_turn!(bd, data)
  dif_lvl = data[:difficulty]
  choice  = nil
  choice ||= mark_last_in_row(bd, data[:computer_piece]) if dif_lvl > 0
  choice ||= mark_last_in_row(bd, data[:player_piece]) if dif_lvl > 1
  choice ||= 5 if bd[5] == EMPTY_SPACE && dif_lvl > 1
  choice ||= get_empty_spaces(bd).sample
  bd[choice] = data[:computer_piece]
end

def process_win(bd, data)
  refresh_screen(bd, data)
  add_point!(data[:scores], data[:winner])
  announce_winner(data)
  if !data[:scores].values.include?(data[:number_of_rounds])
    next_player = data[:player_turn] ? 'player' : 'computer'
    prompt("The #{next_player} will start next!")
    prompt('-----')
  end
  announce_score(data) if !data[:scores].values.all? { |v| v == 0 }
  data[:winner] = nil
  data[:grand_winner] = reached_max_score(data)
end

def end_of_tournament(data)
  winner_name =
    data[:grand_winner] == data[:player_piece] ? "You are" : "The Computer is"
  thought_box("Game Over! #{winner_name} the grand champion!", buffer: 5, clear_on_exit: false)
end

##################################################
#      GAME DATA
##################################################

def add_point!(points, winning_piece)
  points[winning_piece] += 1
end

def reset_score!(data)
  data[:scores]['X'] = 0
  data[:scores]['O'] = 0
end

def reached_max_score(data)
  players = [data[:player_piece], data[:computer_piece]]
  players.select! { |player| data[:scores][player] == data[:number_of_rounds] }
  return players.first if players.size == 1
  nil
end

##################################################
#      INPUT FUNCTIONS
##################################################

def get_string_choice(choices, message, each_and: false)
  choice = nil
  loop do
    prompt(message)
    prompt(choices.join('/')) unless each_and
    prompt(joinor(choices, ', ', 'or')) if each_and
    print("\t>> ")
    choice = gets.chomp.downcase
    break if choices.include?(choice)
    prompt('Please enter a valid option.')
  end
  choice
end

##################################################
#      SETTINGS MENU
##################################################

def settings_menu(data, settings)
  loop do
    display_settings(settings)
    choices = (1..settings.keys.size + 1).to_a.map(&:to_s)
    setting_selection = get_string_choice(choices, 'Which setting would you like to modify?')
    break if setting_selection == (settings.keys.size + 1).to_s
    selected_setting_name = settings.keys[setting_selection.to_i - 1]
    modify_setting!(data, settings, settings[selected_setting_name])
  end
end

def display_settings(settings, after_change: false, offer_quit: true)
  system('clear')
  print_blanks(5)
  prompt('Settings Menu')
  puts
  settings.each do |setting, details|
    puts("\t#{details[:idx]})\t #{details[:desc]}:\t\t #{get_setting_display_val(details)}")
  end
  quit_idx = settings.keys.size + 1
  puts("\t#{quit_idx})\t Return to Main Menu")
  puts
  puts '(Setting updated.)' if after_change
end

def get_setting_display_val(details)
  case details[:type]
  when 'Boolean'
    return 'On' if details[:value]
    'Off'
  else
    if details.has_key?(:display_value)
      details[:display_value][details[:value]]
    else
      details[:value]
    end
  end
end

def modify_setting!(data, settings, setting_to_change)
  # exception to type
  if setting_to_change[:name] == :player_piece
    GAME_PIECES.rotate!
    WIN_MARKERS.rotate!
    initialize_game!(data, settings)
    return
  end
  case setting_to_change[:type]
  when 'Boolean'
    data[setting_to_change[:name]] = !data[setting_to_change[:name]]
    initialize_game!(data, settings)
    system('clear')
  else
    system('clear')
    display_settings(settings, offer_quit: false)
    print("#{setting_to_change[:name]} (#{setting_to_change[:range_display]}) >> ")
    value_choice = get_value_within_range(setting_to_change)
    data[setting_to_change[:name]] = value_choice
    initialize_game!(data, settings)
    system('clear')
  end
end

def get_value_within_range(setting)
  range = setting[:range]
  loop do
    val = gets.chomp.to_i
    return val if range.include?(val)
    prompt('That is not a valid option.')
    prompt("Please give me a value: #{setting[:range_display]}")
  end
end

##################################################
#      GAME LOOP
##################################################

system('clear')
data = initialize_data()
settings = initialize_settings(data)

loop do
  display_menu_options(data[:number_of_rounds])
  menu_selection = get_string_choice(
    %w(p play s settings q quit), 'What would you like to do?'
  )

  if menu_selection[0] == 's'
    settings_menu(data, settings)
    system('clear')
    next
  elsif menu_selection[0] == 'p'
    initialize_game!(data, settings)
    loop do
      game_board = create_new_board

      loop do
        process_turn(game_board, data)
        break if data[:winner] || no_free_spaces?(game_board)
      end

      process_win(game_board, data)
      next if !data[:grand_winner]

      end_of_tournament(data)

      choice = get_string_choice(%w(yes y no n), 'Would you like to play again?')
      if choice[0] == 'y'
        system('clear')
        reset_score!(data)
        data[:quit_game] = false
      else
        data[:quit_game] = true
      end
      break
    end
  elsif menu_selection[0] == 'q'
    system('clear')
    data[:quit_game] = true
  end

  next if !data[:quit_game]
  system('clear')
  thought_box('Thank you for playing!')
  break
end
