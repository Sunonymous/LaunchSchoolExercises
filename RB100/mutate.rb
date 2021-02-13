a = [1, 2, 3]

def mutate(array)
	array.pop
end

=begin
p "Before mutate method: #{a}"
p mutate(a)
p "After mutate method: #{a}"
=end

def eval_test(n)
	random = n * 123
end

num = eval_test(2)
p num