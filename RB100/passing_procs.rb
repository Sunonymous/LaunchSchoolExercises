# procs

def take_proc(proc)
	1..5.times do |n|
		proc.call n
	end
end

yell = Proc.new do |x|
	puts "I yell this #{x} time!"
end


take_proc(yell)