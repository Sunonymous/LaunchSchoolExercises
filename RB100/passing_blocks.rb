# passing blocks!

def take_block(x, &block)
	block.call(x)
end

take_block(42) do |num|
	puts "Some say that #{42} is the answer to all things."
end

talk = Proc.new do
	puts "talktalktalk"
end

talk.call
