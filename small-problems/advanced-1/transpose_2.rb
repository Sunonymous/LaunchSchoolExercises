# Transpose MxN
#
# Problem     |---------------------------------------------------------------|
#             |Write a method to transpose any nested array's columns and rows.
#       Input |A nested array with at least one row and one column.
#       Output|A nested array with rows and columns transposed.
#       Edges |Arrays with less than one column or row per element.
#             |
#       Rules |Arrays may have uneven rows or columns but will always have 1+.
#             |Rows must become columns and columns rows.
#   Questions |
#             |
# Example     |---------------------------------------------------------------|
# transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
# transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  # [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# transpose([[1]]) == [[1]]
# Data        |---------------------------------------------------------------|
#             |Does it even need to be said?
# Algorithm   |---------------------------------------------------------------|
#             |This will be a little trickier. I suppose we'll need to get the
#             |  maximum number of columns in the widest row. We will create a
#             |  number of empty arrays to push within the results array. Then
#             |  we'll iterate over the rows with an inner loop from 0 to 
#             |  max_col, and push each element (if there is one) to the 
#             |  appropriate row.
#             |Return results.
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
  results.each { |r| p r }
end

puts transpose([[1, 2, 3], [4, 5], [6, 7, 8]])
puts transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
puts transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
puts transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
puts transpose([[1]]) == [[1]]
