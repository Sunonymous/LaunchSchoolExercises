# Group Anagrams
#
# Problem     |---------------------------------------------------------------|
#             |Given an array of words, write a program which prints out all the 
#             |anagrams.
#       Input |Array of word strings
#       Output|Array containing all the words from input array that are anagrams.
#       Edges |Empty array? Ignored!
#       Rules |Anagrams are words containing the same letters in another order.
#   Questions |Do I add lists of words that have no anagram matches?
# Example     |---------------------------------------------------------------|
# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          # 'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          # 'flow', 'neon']
# Data        |---------------------------------------------------------------|
#             |Arrayssssssssss
# Algorithm   |---------------------------------------------------------------|
#             |Create an empty array, results
#             |Duplicate the input array into a new array, 'master'
#             |While size of master is greater than 0
#             |  Create a variable, 'word' and set it to the first item in master.
#             |  Create an array, 'anagrams_run' and initialize it with [word]
#             |  Iterate through input Array
#             |    If the iteration word is the same as word, go to next iteration
#             |    If the sorted characters in word equal the sorted characters
#             |      in the iteration word, add it to anagrams_run
#             |  Check the size of anagrams_run, and if greater than 1, add
#             |    the entire array to results
#             |  Iterate over each word in anagrams_run, and delete it from the
#             |    master list.
#             |Return results
# Code________|_______________________________________________________________|
#
def anagrams(words_arr)
  results = []
  master = words_arr.clone
  until master.size == 0
    word = master.first
    anagrams_run = [word]
    words_arr.each do |check_word|
      next if word == check_word
      same_letters = word.chars.sort == check_word.chars.sort
      anagrams_run.push(check_word) if same_letters
    end
    results << anagrams_run
    anagrams_run.each { |w| master.delete(w) }
  end
  results.each {|grams| p grams }
end

def anagrams(words_arr)
  results = Hash.new([])
  words_arr.each do |word|
    key = word.chars.sort.join
    results[key] += [word]
  end
  results.each_value { |words| p words }
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
anagrams(words)
