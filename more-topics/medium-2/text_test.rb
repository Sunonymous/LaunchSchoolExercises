# Text Test

require_relative 'text'
require 'minitest/autorun'

class TextTest < Minitest::Test
  def setup
    @file = File.open("#{__dir__}/sample_text.txt")
    @text = Text.new(@file.read)
    @sample1 = Text.new('Fox, fox! A fox, I say!')
    @sample2 = Text.new('')
    @sample3 = Text.new('And you make me wonder why I wonder that I wonder!')
  end

  def test_swap
    original_content = @text.text
    edited_content = @text.swap('a', 'z')
    num_of_a = original_content.count('a')
    num_of_z = original_content.count('z')
    refute_includes(edited_content, 'a')
    assert_equal(num_of_a + num_of_z, edited_content.count('z'))
  end

  def test_word_count
    assert_equal(6, @sample1.word_count)
    assert_equal(0, @sample2.word_count)
    assert_equal(11, @sample3.word_count)
    assert_equal(@meta.word_count)
  end

  def teardown
    @file.close
  end
end
