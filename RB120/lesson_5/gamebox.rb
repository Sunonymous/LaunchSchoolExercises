# GameBox, The Real

# TODO
# Commit to Hub
# Add Settings Class
# Add Input Class
#   with new Replace Value Function

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
    box = Box.new(2, [message, option_str], box_width+4)
    box.to_s.split("\n").each { |line| puts line.center(width, ' ') }
  end

  def notice(notice)
    clear_screen
    puts Box.new(1, notice, width, 2)
    wait_until_enter
    clear_screen
  end
end

class GameBox
  include Display
  attr_reader :width

  def initialize(width)
    @width = width
  end
end

debug = true

if debug
  puts "\u2317  Tic Tac Toe \u2317"
  t = GameBox.new(75)
  # t.clear_screen
  t.choice_box('What would you like to do?', %w(jump run sit))
else
  # real program
end
