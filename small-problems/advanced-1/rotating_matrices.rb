# Rotating Matrices
#
# Problem     |---------------------------------------------------------------|
#             |Given a matrix (nested array), rotate it 90 degrees so that its
#             |  rows are transposed and reordered so that the first column is
#             |  placed at its right.
#       Input |A matrix
#       Output|A matrix, transposed and rotated 90 degrees.
#       Edges |
#             |
#       Rules |The matrix must be transposed, and the first column moved to the
#             |  right / end side.
#   Questions |Seems we can use Array#rotate and our last method.
#             |
# Example     |---------------------------------------------------------------|
# (See below)
# Data        |---------------------------------------------------------------|
#             |I should turn this field into a checkbox. Array? [x]
# Algorithm   |---------------------------------------------------------------|
#             |Use the transpose method I wrote in the last exercise and then
#             |  rotate it. Works?
#             |Had a horrible time getting that to their standards using rotate.
#             |Wound up using reverse instead.
# Code________|_______________________________________________________________|
#
def transpose(array)
  num_rows = array.map(&:size).max - 1
  num_cols = array.size - 1
  results = []
  0.upto(num_rows) do |r_idx|
    row = []
    0.upto(num_cols) do |c_idx|
      element = array[c_idx][r_idx]
      if !!element
        row.push(element)
      else
        row.push(nil)
      end
    end
    results.push(row)
  end
  results
end

def print_matrix(matrix)
  matrix.each do |row|
    row.each { |e| print e, ' ' }
    print "\n"
  end
end

def rotate90(matrix)
  matrix = transpose(matrix).each { |row| row.reverse! }
end

def rotate_by_90(matrix, times)
  times.times do
    matrix = transpose(matrix).each { |row| row.reverse! }
  end
  matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

# rotate90(matrix1)
# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))
#
# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2
p rotate_by_90(matrix1, 4) == matrix1
p rotate_by_90(matrix2, 2) == [[8, 0, 1, 5], [2, 4, 7, 3]]
