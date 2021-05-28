# Now I Know My ABCs
#
# Problem     |---------------------------------------------------------------|
#             |Given a collection of spelling blocks, return true or false based
#             |on whether or not a given word is able to be spelled using those
#             |blocks.
#       Input |A word.
#       Output|True or false if the word may be spelled using those blocks.
#       Edges |Empty words. Mixed case.
#       Rules |Each block has two letters.
#             |Each block may only be used once.
#   Questions |
# Example     |---------------------------------------------------------------|
# block_word?('BATCH') == true
# block_word?('BUTCH') == false
# block_word?('jest') == true
# Data        |---------------------------------------------------------------|
#             |Arrays will be used here.
# Algorithm   |---------------------------------------------------------------|
#             |Return false if there are any duplicate letters in the word.
#             |Sort the word blocks into an array and dup it to a master copy.
#             |Iterate through the letters in the given word, removing the block
#             |  from the master list containing the current letter.
#             |If the master copy does not have the current letter, return false.
#             |Return true.
# Code________|_______________________________________________________________|
#

WORD_BLOCKS = ['B:O', 'X:K', 'D:Q', 'C:P', 'N:A', 'G:T', 'R:E', 'F:S', 'J:W',
               'H:U', 'V:I', 'L:Y', 'Z:M']

def block_word?(test_word)
  return false if test_word.chars.length != test_word.chars.uniq.length
  word = test_word.upcase
  master = WORD_BLOCKS.dup
  word.each_char do |letter|
    idx_to_del = nil
    master.each_with_index do |block, index|
      idx_to_del = index if block.include?(letter)
    end
    return false if !idx_to_del
    master.delete_at(idx_to_del)
  end
  true
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
