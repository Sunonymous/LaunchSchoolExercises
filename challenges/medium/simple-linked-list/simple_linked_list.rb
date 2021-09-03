# Simple Linked List

# Architecture
# Here it seems we are working with two classes, Element, and SimpleLinkedList.
# The Element Class requires an object for its constructor as its data. It may
#   also be passed a secondary object for its next link.
#   This class contains the following instance methods:
#     - Element#datum - Returns the data contained by the element.
#     - Element#next  - Returns the next connected element or nil.
#     - Element#tail? - Returns true if there is no element afterwards.
# The SimpleLinkedList Class
#   This class requires no arguments to its constructor.
#   It has a class method SimpleLinkedList::from_a(array) to instantiate a class
#     instance from an array of objects.
#   It contains the following instance methods:
#     - SimpleLinkedList#size - Returns the number of elements in the list.
#     - SimpleLinkedList#push - Pushes the element onto the stack.
#     - SimpleLinkedList#empty? - Returns true/false depending on whether list is empty.
#     - SimpleLinkedList#head - Returns the first element in the list, or nil.
#     - SimpleLinkedList#reverse - Reverses the order of the elements.
#     - SimpleLinkedList#to_a - Converts the elements in the list into an array.
#     - SimpleLinkedList#peek - Not sure exactly what this one returns.
#         Sometimes it appears to return the head element, and other times the
#         most recently added one.

# It isn't much of a problem to solve as it is a context to configure...
# Some important things to remember: keep data immutable and avoid arrays!
#   Meaning avoid usage of arrays within the data structure itself...
# This exercise really challenged me because the direction of the "stack" was
#   originally misunderstood!! There was an attempt to construct this "backwards",
#   which was much harder than the intended design. Surprisingly, I had nearly
#   done it too.

class Element
  attr_reader :datum

  def initialize(data, next_em = nil)
    @datum = data
    if next_em
      next_em.is_a?(Element) ? @following = next_em : @following = Element.new(next_em)
    else
      @following = nil
    end
  end

  def next
    @following
  end

  def next=(elem)
    @following = elem
  end

  def tail?
    @following.nil?
  end
end

class SimpleLinkedList
  attr_reader :size, :head

  def initialize
    @size = 0
    @head = nil
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    return list if array.nil? || array.empty?
    array.reverse.each { |elem| list.push(elem) }
    list
  end

  def empty?
    @size.zero?
  end

  def push(elem)
    @size += 1
    if @head
      node = Element.new(elem, @head)
      @head = node
    else
      @head = Element.new(elem)
    end
  end

  def pop
    value = peek
    new   = @head.next
    @head = new
    @size -= 1
    value
  end

  def reverse
    array = to_a
    list = SimpleLinkedList::from_a(array.reverse)
    list
  end

  def peek
    @head ? @head.datum : nil
  end

  def to_a
    elem = head
    result = []
    return result if @size.zero?
    loop do
      result << elem.datum.clone
      break if elem.tail?

      elem = elem.next
    end
    result
  end

  private

  def last_element
    elem = head
    loop do
      break if elem.tail?

      elem = elem.next
    end
    elem
  end
end
