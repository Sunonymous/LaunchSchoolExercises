# Assignment 4 - Introduction to Pedac
# 
# Data Structure / Algorithm Header
# PROBLEM
# # Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.
#
# Input -> String
# Output -> Array of palindrome substrings within Input String.
# Rules:
#  - Palindromes are defined as characters which are at least two characters,
#     which are the same read forwards as backwards. These are case-sensitive.
#  - Empty strings return an empty array.
# Clarify:
#  - Are any other inputs given? Will validation be required?
#
#  I'd like to try writing the code for the substring method on my own first.
# Should have written the pseudocode first.
# Create an empty array 'substrings' to contain the result.
# Create a variable 'idx' to hold the starting index to iterate with.
# Start a loop iterating on idx from 0 until the length of input - 2
# Inside the loop, instantiate a variable 'word_len' at 2
# Iterate on word_len from 2 until >= input.length - idx
# Inside the inner loop, push the slice of input(idx, word_len) to substrings.
# Increment word_len by one.
# End inner loop.
# Outer loop - increment idx by one.
# End outer loop.
# Return substrings.
#
# I'll try my hand at converting that to more formal pseudocode.
# START (input of 'str')
# SET substrings = []
# SET index = 0
# while index <= str.length - 2
#   SET word_len = 2
#   while word_len <= str.length - index
#     SET substr = str[index, word_len]
#     PUSH substr to substrings
#     ++ word_len 
#   ++ index
# RETURN substrings
# END

def substrings(str)
  substrings = []
  idx = 0
  while idx <= str.length - 2
    word_len = 2
    while word_len <= str.length - idx
      substrings.push(str.slice(idx, word_len))
      word_len += 1
    end
    idx += 1
  end
  substrings
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(string)
  results = []
  substrings(string).each do |ss|
    results.push(ss) if is_palindrome?(ss)
  end
  results
end

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []
