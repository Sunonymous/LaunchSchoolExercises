# Transpose 3x3
#
# Problem     |---------------------------------------------------------------|
#             |Given a 3x3 nested array, transpose all the rows into columns.
#       Input |A nested array, three elements with three elements each.
#       Output|A transposed nested array, three elements with three elements each.
#       Edges |Wrong array size? (Potentially solvable)
#             |
#       Rules |Each row of three elements must appear as a column in the return
#             |May not use the Matrix class or transpose method.
#   Questions |
#             |
# Example     |---------------------------------------------------------------|
# (Seen below in tests)
# Data        |---------------------------------------------------------------|
#             |Arrrrrays
# Algorithm   |---------------------------------------------------------------|
#             |I'm going to expand on this a little bit. For the purposes of
#             |  this exercise, the array must be in the dimensions of a perfect
#             |  square, i.e. each row must have the same number of elements
#             |  as the number of row.
#             |So first, verify that the dimensions are even.
#             |Then create a results array. Start a loop from 0 to dimension - 1
#             |  and start a new loop to add the elements at position [i][j] to
#             |  a temporary row, which you may then push onto the results.
#             |Return results once completed.
# Code________|_______________________________________________________________|
#
def dimensions_even?(array)
  !!array.each do |row|
    return false if row.size != array.size
  end
end

def transpose(array)
  if !dimensions_even?(array)
    raise ArgumentError.new("Array must have equal number of columns and rows.")
  end
  results = []
  0.upto(array.size - 1) do |col|
    new_row = []
    0.upto(array.size - 1) do |row|
      new_row.push(array[row][col])
    end
    results.push(new_row)
  end
  results
end

# arr = [
# [1, 2, 3],
# [4, 5, 6],
# [7, 8, 9]
# ]
# transpose(arr).each { |row| p row }

# LS Tests
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Further Exploration
# First, center, and last stay the same
# Can we swap those four other positions?
def transpose!(array)
  array[0][1], array[1][0] = array[1][0], array[0][1]
  array[0][2], array[2][0] = array[2][0], array[0][2]
  array[1][2], array[2][1] = array[2][1], array[1][2]
  array
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

transpose!(matrix)

p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
