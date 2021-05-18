# Madlibs
#
# Problem     |---------------------------------------------------------------|
#             |Prompt the user for a noun, a verb, an adverb, and an adjective,
#             |and insert the given words into a story.
#       Input |Four user-given words.
#       Output|A story with those words inserted.
#       Edges |Input is empty, foreign symbols, wrong type of words.
#       Rules |
#   Questions |
# Example     |---------------------------------------------------------------|
# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly
#
# Do you walk your blue dog quickly? That's hilarious!
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |Request from the user a noun, verb, adverb, and adjective, using
#             |the appropriate submethods.
#             |Interpolate the given values into a string and return it.
#             |SUBMETHOD -- GET_INPUT
#             |Prompt the user for the given part of speech and store it in a variable.
#             |Check if the input given is not empty and return true if this is so.
#             |If the input is acceptable, return it for use in the program.
# Code________|_______________________________________________________________|
#
def get_word(request)
  word = ""
  loop do
    print("Please provide me a #{request}:\n>> ")
    word = gets.chomp
    return word if !word.empty?
  end
end

def madlib()
  noun = get_word('noun')
  verb = get_word('verb')
  adjective = get_word('adjective')
  adverb = get_word('adverb')
  story = %{Once, long ago, there was a #{noun}.
No one knew much about it, because it was #{adjective}.
Sometimes, when it #{verb}, it did so #{adverb}.}
  puts story
end

madlib
