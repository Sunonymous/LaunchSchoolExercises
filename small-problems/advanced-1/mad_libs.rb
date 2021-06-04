# MadLibs Revisited
#
# Problem     |---------------------------------------------------------------|
#             |Read in a text file and replace the blanks using the appropriate
#             |  part of speech.
#       Input |A text file with each line being a particular sentence.
#       Output|The lines in the text file with each blank replaced.
#       Edges |Empty file, invalid file. Not enough parts of speech to use.
#             |
#       Rules |Replace the blanks with the appropriate part of speech.
#             |
#   Questions |This is a very loose exercise. Not much is happening.
# Example     |---------------------------------------------------------------|
# The sleepy brown cat noisily
# licks the sleepy yellow
# dog, who lazily licks his
# tail and looks around.
# Hmm... now which were replaced??
# Data        |---------------------------------------------------------------|
#             |We will use arrays to hold the parts of speech.
# Algorithm   |---------------------------------------------------------------|
  #           |Create a text file with the words to replace with abbreviated
#             |  parts of speech, e.g. ADJ, VRB, NUN
#             |Create the arrays full of subsitution words, one array per part
#             |  of speech.
#             |Open the file and read it by lines, iterating through each line
#             |  by word. If the word matches a part of speech replacement, 
#             |  replace it with a random entry from an array.
# Code________|_______________________________________________________________|
#
nouns = ['doll', 'pickle', 'fence', 'mummy', 'diamond']
verbs = ['runs', 'jumps', 'deciphers', 'wraps', 'unwinds']
adjectives = ['purple', 'shining', 'dull', 'drab', 'goofy']
adverbs = ['never', 'occasionally', 'joyfully', 'exhaustingly', 'completely']

# stories = File.open(File.join(File.dirname(__FILE__), 'story.txt'))
                # .read.split('\n')
stories = File.open('story.txt')
compiled_stories = []
stories.each do |story|
  words = []
  story.split.each do |word|
    fill = case word
           when 'ADJ' then adjectives.sample
           when 'NUN' then nouns.sample
           when 'ADV' then adverbs.sample
           when 'VRB' then verbs.sample
           else
             word
           end
    words.push fill
  end
  compiled_stories.push(words.join(' '))
end
compiled_stories.each { |story| puts story.gsub(/ ([.,!?])/, '\1') }

# Doesn't solve the issue of replacing words which begin sentences not 
# being capitalized.
