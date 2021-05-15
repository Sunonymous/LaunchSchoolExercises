# Bannerizer
#
# Problem     |---------------------------------------------------------------|
#             |Given a small phrase, create a method to print the message in a
#             |stylized output and box.
#       Input |A string message.
#       Output|A formatted box-style message printed to the console.
#       Edges |Empty string, strings longer than console width.
#       Rules |The input will always fit within the terminal window.
#   Questions |
#             |
# Example     |---------------------------------------------------------------|
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# Data        |---------------------------------------------------------------|
#             |A constant will hold the components of the box for structuring.
# Algorithm   |---------------------------------------------------------------|
#             |Boxes are made up of characters in a hash constant.
#             |Given the message, 'str', save its width in a variable, 'wide'.
#             |Call a sub-method to build top row, passing in wide.
#             |Call a sub-method to build an empty row, using wide.
#             |Call a sub-method to build the row with the message.
#             |Call a sub-method to build an empty row, using wide.
#             |Call a sub-method to build the bottom row, using wide.
#   SubMethods|
#       header|Passed the width, print an interpolated string of edge_char,
#             |bar_char of size wide. Print a final edge_char.
#      message|Passed the width, print an edge_char, followed by a centered,
#             |interpolated string of message, followed by another edge_char.
# Code________|_______________________________________________________________|
#
BOX_BITS = {
  edge: '#',
  bar:  '='
}.freeze
MAX_MESSAGE_SIZE = 74 # assuming console is 80

def print_box_edge(width)
  string = ''
  string << BOX_BITS[:edge]
  string << BOX_BITS[:bar] until string.length == (width - 1)
  string << BOX_BITS[:edge]
  puts string
end

def print_row_in_box(message, width)
  string = ''
  string << BOX_BITS[:edge]
  string << message.center(width - 2)
  string << BOX_BITS[:edge]
  puts string
end

def print_in_box(message)
  message = message[0, MAX_MESSAGE_SIZE] if message.length > MAX_MESSAGE_SIZE
  width = message.length + 4
  print_box_edge(width)
  print_row_in_box('', width)
  print_row_in_box(message, width)
  print_row_in_box('', width)
  print_box_edge(width)
end

def print_in_box_fe(message)
  queue = []
  width = [message.length, MAX_MESSAGE_SIZE].min
  loop do
    break if message.empty?
    if message.size >= MAX_MESSAGE_SIZE
      sub_string = message[0..MAX_MESSAGE_SIZE]
    else
      sub_string = message[0..-1]
    end
    width = [width, sub_string.length].max
    queue << sub_string
    message = message[sub_string.size..-1]
  end

  print_box_edge(width)
  print_row_in_box('', width)
  queue.each do |msg|
    print_row_in_box(msg, width - 2)
  end
  print_row_in_box('', width)
  print_box_edge(width)
end

print_in_box_fe('no more no more no more')
# I didn't finish the fe exercise, though I got it fairly close.
