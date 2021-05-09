# Odd Lists
#
def oddities(array)
  return [] if array.empty?
  array.select { |em| array.index(em) % 2 == 0 }
end

def oddities_even(array)
  return [] if array.empty?
  array.select { |em| array.index(em) % 2 != 0}
end

def oddities2(array)
  results = []
  array.each_with_index { |em, idx| results.push(em) if idx % 2 == 0 }
  results
end

def oddities3(array)
  results = []
  (0...array.size).step(2).each do |idx|
    results.push array[idx]
  end
  results
end
