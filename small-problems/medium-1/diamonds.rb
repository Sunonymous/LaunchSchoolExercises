# Diamonds!
#
# Problem     |---------------------------------------------------------------|
#             |Given an odd integer, display a 4-pointed diamond in a grid the
#             |size of the given integer. n x n
#       Input |An odd integer
#       Output|A printed diamond within a grid.
#       Edges |Wrong input, e.g. even numbers (ignored)
#             |Negative integers
#       Rules |Diamond will only contain lines with an odd number of *
#             |Diamond is composed of * symbols.
#             |Diamond will be as wide and tall as n.
#             |
#   Questions |
#             |
# Example     |---------------------------------------------------------------|
# diamond(3)
 # *
# ***
 # *
# Data        |---------------------------------------------------------------|
#             |An intermediary array
# Algorithm   |---------------------------------------------------------------|
#             |Create an range from 1 to n with only odd numbers.
#             |Iterate over the range, printing a centered string of the
#             |  * symbol times the value of the iteration
# Code________|_______________________________________________________________|
#
def diamond(size)
  size = size.abs if size.negative?
  rows = (1..size).step(2).to_a
  rows.concat(rows.reverse[1..-1])
  rows.each { |row| puts ('*' * row).center(size, ' ') }
end

def hollow_diamond(size)
  size = size.abs if size.negative?
  rows = (1..size).step(2).to_a.concat(rows.reverse[1..-1])
  rows.each do |row|
    line = row == 1 ? '*' : "*#{' ' * (row - 2)}*"
    if row < size
      spaces = size - row
      puts "#{' ' * (spaces / 2)}#{line}#{' ' * (spaces / 2)}"
    else
      puts line
    end
  end
end

hollow_diamond(5)
diamond(5)
