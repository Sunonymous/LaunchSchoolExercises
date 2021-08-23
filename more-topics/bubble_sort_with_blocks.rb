# Bubble Sort with Blocks

# Rewriting Bubble Sort
# P
#   Rewrite bubble sort to use a block as the criteria for swapping the elements
#   So we should replace the conditional for yielding the two items to the block
# e
# d
# A
# C

def bubble_sort!(array)
  loop do
    swap_made = false
    index = 0
    until index >= array.size - 1
      no_block = array[index] > array[index + 1]
      need_swap = block_given? ? !yield(array[index], array[index + 1]) : no_block
      if need_swap
        array[index], array[index+1] = [array[index+1], array[index]]
        swap_made = true
      end
      index += 1
    end
    next if swap_made
    break
  end
  nil
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)
