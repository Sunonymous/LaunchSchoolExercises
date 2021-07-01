# GameBox, The Real

# WATCHFOR
# Keep an eye on how the Settings Menu/Interface interacts with the Recast/Replace Method
# If too many settings appear, better to refactor to include categories.
# TODO

class Box
  attr_reader :width

  @@parts = {
    topl:   ["\u250C", "\u250F", "\u256D", "\u250C", "\u2554"],
    top:    ["\u2500", "\u2501", "\u2500", "\u2504", "\u2550"],
    topr:   ["\u2510", "\u2513", "\u256E", "\u2510", "\u2557"],
    side:   ["\u2502", "\u2503", "\u2502", "\u250A", "\u2551"],
    botl:   ["\u2514", "\u2517", "\u2570", "\u2514", "\u255A"],
    bottom: ["\u2500", "\u2501", "\u2500", "\u2504", "\u2550"],
    botr:   ["\u2518", "\u251B", "\u256F", "\u2518", "\u255D"],
    space:  ' '
  }

  def initialize(box_type, msg, width, buffer=0)
    @box_type = box_type
    @text     = msg
    @width    = width
    @lines    = []
    @lines.push(make_top)
    buffer.times { @lines.push(make_buffer) }
    make_text
    buffer.times { @lines.push(make_buffer) }
    @lines.push(make_bottom)
  end

  def topl;   @@parts[:topl][@box_type];   end
  def top;    @@parts[:top] [@box_type];    end
  def topr;   @@parts[:topr][@box_type];   end
  def side;   @@parts[:side][@box_type];   end
  def botl;   @@parts[:botl][@box_type];   end
  def bottom; @@parts[:bottom][@box_type]; end
  def botr;   @@parts[:botr][@box_type];   end
  def space;  @@parts[:space];             end
  
  def make_top
    "#{topl}#{top * (width - 2)}#{topr}"
  end

  def make_buffer
    "#{side}#{space * (width - 2)}#{side}"
  end

  def make_text
    if @text.is_a?(Array)
      @text.each { |msg| @lines.push("#{side}#{msg.center(width - 2)}#{side}") }
    else
      @lines.push("#{side}#{@text.center(width - 2)}#{side}")
    end
  end

  def make_bottom
    "#{botl}#{bottom * (width - 2)}#{botr}"
  end
  
  def to_s
    @lines.join("\n")
  end
end

module Display
  attr_reader :width

  def clear_screen
    system('clear')
  end

  def wait_until_enter(message='(Press enter to continue...)')
    puts
    puts message.center(width)
    gets
  end

  def message(message, wait=false)
    puts Box.new(0, message, width, 1)
    wait_until_enter if wait
  end

  def update(message, wait=false)
    puts Box.new(0, message, width)
    wait_until_enter if wait
  end

  def choice_box(message, options)
    option_str = options.join('/')
    box_width = [message.length, option_str.length].max
    to_print = options.size > 1 ? [message, option_str] : [message]
    box = Box.new(2, to_print, box_width+4)
    box.to_s.split("\n").each { |line| puts line.center(width, ' ') }
  end

  def notice(notice)
    clear_screen
    puts Box.new(1, notice, width, 2)
    wait_until_enter
    clear_screen
  end
end

module Input
  def get_nonempty_string(message, prompt="\t>> ")
    choice_box(message, [''])
    loop do
      print(prompt)
      choice = gets.chomp
      return choice if !choice.strip.empty?
      puts 'Please enter a valid response.'
    end
  end

  def get_choice(message, options)
    choice_box(message, options)
    loop do
      print("\t>> ")
      choice = gets.chomp.downcase
      return choice if options.map(&:to_s).include?(choice)
      puts 'Invalid response. Please try again.'
    end
  end

  def replace_with_choice(message, options)
    selection = get_choice(message, options)
    recast_to_original_type(options.first, selection)
  end

  def get_within_range(range, prompt="\t>> ")
    # function limited to integer ranges
    msg = "Please provide a value between #{range.first} and #{range.last}."
    choice_box(msg, [''])
    loop do
      print(prompt)
      choice = gets.chomp.downcase
      cast_options = range.to_a.map(&:to_s)
      return choice.to_i if cast_options.include?(choice)
      puts 'Invalid response. Please try again.'
    end
  end

  def recast_to_original_type(klass, object)
    case klass
    when Integer then object.to_i
    when TrueClass, FalseClass then object.downcase.to_i == 'true'
    when Float then object.to_f
    end
  end
end

class Settings
  include Display, Input

  attr_reader :settings, :catalog, :width

  def initialize(menu_width)
    @settings = {}
    @catalog = []
    @width = menu_width
    @header_spacing = 2
    @list_spacing = 2
  end

  def clear;     @settings.clear;            end
  def get(name); @settings[name].get;        end
  def set(name); @settings[name].change_val; end

  def prompt(message)
    puts "\u21E8 #{message} \u21E6".center(@width)
  end

  def make(name, display_name, value, range, display_vals=nil)
    @settings[name] = Setting.new(display_name, value, range, display_vals)
  end

  def menu
    loop do
      system('clear')
      display_settings
      choice = get_setting_to_edit
      break if choice == 0
      alter(get_from_id(choice))
    end
  end

  def display_settings(offer_quit=true)
    @header_spacing.times { puts }
    prompt('Settings Menu')
    @header_spacing.times { puts }
    @list_spacing.times   { puts }
    list_all_settings(offer_quit)
    @list_spacing.times   { puts }
  end

  def build_settings_catalog
    ids = 1..settings.size
    @catalog = ids.zip(settings.keys)
  end

  def list_all_settings(offer_quit)
    build_settings_catalog
    catalog.each do |combo|
      id = combo.first
      setting = settings[combo.last]
      puts "\t\t#{id}. #{setting}"
    end
    puts "\n\t\tOr type quit to return to the Main Menu." if offer_quit
  end

  def get_setting_to_edit
    options = []
    catalog.each { |pair| options.push(pair.first) }
    options.concat(['q', 'quit'])
    replace_with_choice('Choose a setting to edit:', options)
  end

  def get_from_id(id)
    catalog.each do |pair|
      symbol = pair.last
      return settings[symbol] if pair.first == id
    end
  end

  def get_from_named_options(topic, options)
    numbers = (1..options.size).to_a
    puts "(#{topic})".center(width)
    numbers.each do |num|
      puts "#{num} - #{options[num - 1]}".center(width)
    end
    puts "\n\n"
    (replace_with_choice('Please select an option from above.', numbers)) - 1
  end

  def alter(setting)
    clear_screen
    display_settings(false)
    prompt = "\t\t(#{setting.name}) << "
    if setting.range.is_a?(String)
      msg = "Enter a new value:"
      setting.set(get_nonempty_string(msg, prompt))
    elsif setting.range.is_a?(Range)
      setting.set(get_within_range(setting.range, prompt))
    elsif setting.range.is_a?(Array) && !setting.boolean?
      setting.set(get_from_named_options(setting.name, setting.display_values))
    elsif setting.range.is_a?(Array) && setting.boolean?
      setting.set(!(setting.value))
    end
  end
end

class Setting
  TYPES   = [String, Integer, TrueClass, FalseClass]
  ONOFF   = ['On', 'Off']
  YESNO   = ['Yes', 'No']

  attr_reader :range, :type, :value, :display_values

  def initialize(display_name, value, range, display_values=nil)
    if !TYPES.include?(value.class)
      raise ArgumentError.new("Invalid Setting Type #{value.class}")
    end
    @type           = value.class
    @value          = value
    @display_name   = display_name
    @display_values = display_values
    @range          = range
    @string_width   = 40
  end

  def display_value
    return @value.to_s unless !!display_values
    "#{@display_values[range.index(@value)]}"
  end

  def to_s
    right_hand = @string_width - @display_name.length
    "#{@display_name}: #{display_value.rjust(right_hand)}"
  end

  def name; @display_name; end
  def get;      @value;                        end
  def boolean?; @range.to_a.size == 2;         end

  def set(new_val)
    @value = new_val
  end
end


class GameBox
  include Display, Input
  attr_reader :width, :settings

  def initialize(width)
    @width = width
    @settings = Settings.new(@width)
    default_settings
  end

  def default_settings
    settings.clear
    settings.make(:console_width, 'Game Width', @width, 50..100)
    settings.make(:player_1_human, 'Player One is Human', true, [true, false], Setting::YESNO)
    settings.make(:player_1_name, 'Player 1 Name', 'Player', 'str')
    settings.make(:bot_difficulty, 'Computer Difficulty', 2, (0..2).to_a, ['Haybale', 'Distracted', 'Challenging'])
  end
end

debug = true

if debug
  puts "\u2317  Tic Tac Toe \u2317"
  puts
  t = GameBox.new(75)
  # t.clear_screen
  # t.settings.menu
  loop do
    # main_menu
    # menu_choice
    break
  end
else
  # real program
end
