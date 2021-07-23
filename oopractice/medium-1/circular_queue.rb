=begin
class CircularQueue
  def initialize(size)
    bad_size = size.zero? || size.negative?
    raise ArgumentError, "Cannot initialize ring with size of zero." if bad_size
    @ring = [nil] * size
    @index = 0
    @decay = nil
  end

  def enqueue(obj)
    if empty? || !full?
      @ring[@index] = obj
      @decay = @index if @decay.nil?
      @index = next_slot(@index)
    elsif full?
      @ring[@decay] = obj
      @decay = next_slot(@decay)
    end
  end

  def dequeue
    return nil if empty?

    obj = @ring[@decay]
    @ring[@decay] = nil
    @decay = next_slot(@decay)
    obj
  end

  # private

  def next_slot(slot)
    (slot + 1) >= @ring.size ? 0 : slot + 1
  end

  def empty?
    @ring.all?(nil)
  end

  def full?
    @ring.none?(nil)
  end
end
=end

# Further Exploration
class CircularQueue
  def initialize(size)
    @ring = []
    @size = size
  end

  def enqueue(obj)
    @ring.shift if @ring.size == @size
    @ring.push(obj)
  end

  def dequeue
    @ring.empty? ? nil : @ring.shift
  end
end

# P
#   Create a class for a data structure of a circular queue.
#   When an object is added to the queue, it is added to the position after the
#     most recently-added object.
#   When an object is removed, the queue removes the oldest object.
#   If the buffer is full, adding a new object removes the oldest object.
# D
#   An array will hold the objects in the queue.
#   Instance Variable @index (to track last placement)
#   Instance Variable @ring  (to hold objects)
#   Instance Variable @decay (to track the oldest object)
# A
#   Public method enqueue(obj), which adds an item to the next index
#     If the ring has at least one space, add obj next_index
#     If the ring is full, replace object at @decay and set @decay to next_index
#   Public method dequeue, which removes and returns the object at @decay
#   Private method ring_full?, which returns true/false if all slots are filled
#   Private method next_index, which gets the next index and loops around
#
#
#
# C

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
