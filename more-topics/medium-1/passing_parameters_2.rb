# Passing Parameters Part Two

def one_two_three_plus(array)
  # Assigns contents of array into three variables
  raise ArgumentError, '<array> must contain at least three elements.' if array.size < 3
  yield(array)
end

birds = %w(raven finch hawk eagle)
one_two_three_plus(birds) do |raven, finch, *raptors|
  puts "Raven: #{raven}"
  puts "Finch: #{finch}"
  puts "Raptors: #{raptors}"
end
