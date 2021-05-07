# Even Numbers
# since this is so similar to the last one,
#   I'm not writing PEDAC!
#
def evens(start, last)
  idx = start
  while idx <= last
    puts idx if idx.even?
    idx += 1
  end
end

evens(1, 99)
