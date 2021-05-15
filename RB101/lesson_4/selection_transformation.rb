# Just Practice --delete file later
#
def general_select(hash, value_filter)
  keys = hash.keys
  idx = 0
  results = {}

  until idx == keys.size
    current_key = keys[idx]
    current_value = hash[current_key]
    results[current_key] = current_value if current_value == value_filter
    idx += 1
  end

  results
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
p produce.first
# p general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
# p general_select(produce, 'Meat')      # => {}

def multiply(arr, multiply_by)
  idx = 0
  results = []
  until idx == arr.size
    results << arr[idx] * multiply_by
    idx += 1
  end
  results
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) == [3, 12, 9, 21, 6, 18]
