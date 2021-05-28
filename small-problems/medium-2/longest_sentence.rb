# Longest Sentence
#
# Problem     |---------------------------------------------------------------|
#             |Read the content of a text file and print out the longest 
#             |sentence in the file, via number of words. Print word count too.
#       Input |A text file with English prose.
#       Output|The longest sentence in the file, with the number of words.
#       Edges |Empty files. Files without punctuation.
#       Rules |Sentences end in ., !, or ?.
#             |Any characters in a sequence which aren't spaces or sentence-
#             |  terminating punctuation should be considered as words.
#   Questions |Is file reading going to be on the assessment?
#             |
# Example     |---------------------------------------------------------------|
#             |N/A - For the given file, the longest sentence is the last, 86.
# Data        |---------------------------------------------------------------|
#             |Will be processed using arrays.
# Algorithm   |---------------------------------------------------------------|
#             |Split the string into sentences using regular expression.
#             |Map over the sentences storing the length of splitting each
#             |  by its number of words, and saving into a new variable.
#             |Get the max value from the word_count array and return it with
#             |  the sentence at the same index.
# Code________|_______________________________________________________________|
#
def longest_sentence(str)
  sentences = str.split(/\.|!|\?/)
  sentences.map! do |sentence|
    index = str.index(sentence) + sentence.length
    sentence += str[index]
  end
  word_count = sentences.map { |sentence| sentence.split(' ').size }
  index = word_count.index(word_count.max)
  puts "The longest sentence has #{word_count[index]} words."
  puts sentences[index]
end

file = File.open(File.join(File.dirname(__FILE__), 'pg84.txt'))
text = file.read
longest_sentence(text)

# longest_sentence('Hello, hello! Thank you for coming. What a sample, right?')
