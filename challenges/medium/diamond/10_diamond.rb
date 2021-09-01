# Diamond

# Architecture
# Diamond is a class with a class method Diamond::make_diamond(letter), which
#   takes a string with a single capital letter and returns the full diamond string.

# P
#   Print out a diamond with the following characteristics:
#     - The first and last row contain one 'A'
#     - All rows except first and last have two identical letters.
#     - The diamond is horizontally and vertically symmetrical.
#     - The diamond is a square shape, of equal height and width.
#     - The letters form a diamond shape.
#     - The top half has the letters in ascending order, and the bottom half descending.
#     - The four corners (with spaces) form triangles.
# examples in test file
# data: Classes and Arrays
# A
#   We only need to generate the top half of the diamond, and then flip it (not
#     including the middle row) and place the flipped side onto the bottom.
#   The size of the diamond follows odd numbers. If we get the index of the given
#     letter within the alphabet, we can add two to a size variable initialized
#     at 1 the same number of times as the index.
#   All of the lines will be added to an array object to be cast to a string
#     and returned at the end.
#   Let's think about the iteration. The first line (and subsequently the last)
#     are different than the middle, only having one letter, which is always A.
#   We can use the index of the letter given to iterate from 0 to that index.
#   If the index is 0, we add the top line of the diamond, which is an interpolation
#     of the letter A surrounded by two sets of spaces ((size of the diamond minus
#     1) / 2).
#   That number of outer spaces should be assigned to a variable and decremented by
#     1 each iteration.
#   After the first iteration we are making a new kind of line. Because we already
#     have the number of outer spaces saved, we interpolate those into the beginning
#     and end of the string. The number of spaces between the letters can be
#     calculated by subtracting (outer spaces * 2 + 2) from the diamond's size.
#   Once we have up to the index of the letter given, then we append the reversed
#     version of the array excepting the last line, and return it all.
# C

class Diamond
  LETTERS = ('A'..'Z').to_a
  SPC = ' '

  def self.make_diamond(letter)
    input_err = '<letter> must be a single letter from A to Z.'
    raise ArgumentError, input_err unless ('A'..'Z').to_a.include?(letter.upcase)
    letter = letter.upcase
    size = 1
    (LETTERS.index(letter)).times { size += 2 }
    array = make_front(size, LETTERS.index(letter))
    add_reversed_half(array).join
  end

  def self.make_front(size, upto)
    results = []
    idx = 0
    out_spc = (size - 1) / 2
    results << "#{SPC * out_spc}#{LETTERS[idx]}#{SPC * out_spc}\n" if idx.zero?
    while idx < upto
      out_spc -= 1
      idx += 1
      in_spc = size - (out_spc * 2 + 2)
      results << "#{SPC * out_spc}#{LETTERS[idx]}#{SPC * in_spc}#{LETTERS[idx]}#{SPC * out_spc}\n"
    end
    results
  end
  private_class_method :make_front

  def self.add_reversed_half(array)
    all_but_last = array[0..-2]
    array + all_but_last.reverse
  end
  private_class_method :add_reversed_half
end
