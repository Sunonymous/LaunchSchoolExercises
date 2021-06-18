# Banner Class

class Banner
  def initialize(message, width=message.length)
    @message = message
    @width = width
    @width = @message.length if @width < @message.length
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @width }-+"
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def message_line
    "| #{@message.center(@width)} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 8)
puts banner

banner2 = Banner.new('', 50)
puts banner2
