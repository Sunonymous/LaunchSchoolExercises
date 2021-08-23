# Listening Device

# P
#   Create a listening device class. This class saves the data it records inside
#     an instance variable, @recordings. It only listens when something is said.
#   Anything said is sent via a block. If nothing is said, no block is given.
#   The device can also output the most recent recording, via Device#play
# examples below
# data: Class with array instance variable
# A
#   Not much to do here. The record and initialize functions are already present.
#   What is needed is the Device#listen method, which will do the following:
#     if a block is given, save the return value of yielding to the block in
#       a local variable, and pass that variable into the record function.
#   Another needed function is Device#play, which simply returns the last value
#     in the @recordings instance variable.
# C

class Device
  def initialize
    @recordings = []
  end

  def listen
    # refactored before even being written!
    record(yield) if block_given?
  end

  def record(recording)
    @recordings << recording
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { 'Hello World!' }
listener.listen { 'Did you hear about Tom?' }
listener.listen { 'Yeah, they say he broke all the [REDACTED]'}
listener.listen
listener.listen { 'Wait... what\'s this device here? Hold on...' }
listener.play
