# Internal vs External Iterators

facts = Enumerator.new do |f|
  idx = 0
  loop do
    f << (idx + 1).downto(1).reduce(:*)
    idx += 1
  end
end

puts facts.take(7)

def hacky_factorial(n)
  facts = Enumerator.produce(1) do |num, fact|
    [num + 1, (num + 1).downto(1).reduce(:*)]
  end
  facts.take(n).last.last
end

# puts hacky_factorial(6)
