# Alphabetical Numbers
#
# Problem     |---------------------------------------------------------------|
#             |Given an array of integers between zero and nineteen, sort them
#             |in the order of their English equivalent, e.g. zero and nineteen.
#             |
#       Input |Array of integers, 'int_array'
#       Output|New, sorted array of the same integers.
#       Edges |Empty array should return an empty array.
#             |
#       Rules |Numbers are sorted by English, not numerical value.
#             |While not the same array, input and output have equal length.
#             |
#   Questions |
#             |
#             |
# Example     |---------------------------------------------------------------|
# alphabetic_number_sort((0..19).to_a) == [
  # 8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  # 6, 16, 10, 13, 3, 12, 2, 0
# ]
# Data        |---------------------------------------------------------------|
#             |Arrays are both the input and used during processing of the data.
# Algorithm   |---------------------------------------------------------------|
#             |Create a hash constant to hold the names of the numbers.
#             |Map int_array to its English equivalent via hash constant.
#             |Sort int_array by name.
#             |Remap int_array into numerical equivalents and return it.
# Code________|_______________________________________________________________|
#
NUMBER_NAMES = {
  0  => 'zero',
  1  => 'one',
  2  => 'two',
  3  => 'three',
  4  => 'four',
  5  => 'five',
  6  => 'six',
  7  => 'seven',
  8  => 'eight',
  9  => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen'
}

def alphabetic_number_sort(int_array)
  int_array.map! do |num|
    num = NUMBER_NAMES[num]
  end
  int_array.sort!
  int_array.map! { |num| NUMBER_NAMES.key(num) }
  int_array
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
