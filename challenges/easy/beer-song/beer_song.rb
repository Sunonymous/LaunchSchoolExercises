# Beer Song

# Architecture
# BeerSong is a class with a class method, BeerSong::verse(num) which returns the
#   song's stanza at verse `num` as a string. Note that the song's verse is not
#   ordinal and instead references the starting number in the lyrics.
# The class has another class method, BeerSong::lyrics, which returns the entire
#   song as a string.

# P
#   Print out copies of a verse of a song with a constantly-depreciating count.
#   A verse may be requested starting at a particular number or from the standard
#     of 99.
#   Verses should be separated by a blank line.
# examples in test cases
# data: mostly the class and class variables
# A
#   When requesting an individual verse, the count variable should replace the
#     class variable for the bottles.
#   Each verse should print out both lines with interpolated values, followed by
#     a blank line for... posterity and visual organization.
#   When the entire song is requested, the class should just make a giant string
#     compiled from the invocation of the verse method from 99 to 1
# C

# This exercise was far more challenging than expected. It revealed some very
# inconvenient truths, such as the fact that playing with class variables inside
# private class methods does not work well.
# Making the subtle tweaks between verses did not result as smooth as hoped.
# This version is unsatisfactory.

class BeerSong
  @@start = 99
  @@bottles = @@start

  def self.verse(num)
    generate_verse(num)
  end

  def self.verses(start_num, end_num)
    text = ''
    verses = start_num.downto(end_num).to_a
    verses.each do |count|
      text << generate_verse(count)
      text << "\n" unless count == verses.last
    end
    text
  end

  def self.lyrics
    text = ''
    verses = 99.downto(0).to_a
    verses.each do |count|
      text << generate_verse(count)
      text << "\n" unless count == verses.last
    end
    text
  end

  def self.generate_verse(num)
    stanza = order_stanzas(num)
    text = ''
    stanza.each { |line| text << line }
    text
  end

  def self.order_stanzas(num)
    s = ->(b) { b > 1 ? 's' : '' }
    line1 = "#{num} bottle#{s.call(num)} of beer on the wall, #{num} bottle#{s.call(num)} of beer.\n"
    line2 = "Take one down and pass it around, #{num - 1} bottle#{s.call(num - 1)} of beer on the wall.\n"
    line3 = "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end1  = "No more bottles of beer on the wall, no more bottles of beer.\n"
    end2  = "Go to the store and buy some more, #{@@start} bottles of beer on the wall.\n"
    if num <= 0
      [end1, end2]
    elsif num == 1
      [line1, line3]
    else
      [line1, line2]
    end
  end
  private_class_method :generate_verse, :order_stanzas
end
