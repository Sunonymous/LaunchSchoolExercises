# Leading Substrings
#
# Problem     |---------------------------------------------------------------|
#             |Write a method which returns a list of all substrings from a string
#             |starting at its beginning. The substrings are arranged from shortest
#             |to longest.
#       Input |A string
#       Output|An array with all substrings starting at the first character.
#       Edges |Empty strings
#             |
#       Rules |Substrings must start from the first character of the input string.
#             |Substrings are arranged in the array from shortest to longest.
#   Questions |What about empty strings? Unclear!
#             |
# Example     |---------------------------------------------------------------|
# leading_substrings('abc') == ['a', 'ab', 'abc']
# leading_substrings('a') == ['a']
# leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
# Data        |---------------------------------------------------------------|
#             |Arrays are used to store data here.
# Algorithm   |---------------------------------------------------------------|
#             |Create an empty array, 'results'
#             |Create a variable, 'length_idx', and initialize it to 1.
#             |Loop through the characters in the input string
#             |  Add the result of joining a slice of the array starting from
#             |    index 0 and with a length of length_idx
#             |  Increment length_idx; break if length_idx is greater than array size
#             |Return results
# Algorithm   |Part 2! All Substrings
#             |This will make use of the previous algorithm. All that is needed
#             |is to run another loop where we track the starting index for the
#             |substrings, and run a shorter version of the string into the method
#             |from before and concatenate the results into a new, outer, results array.
# Algorithm   |Part 3! Palindromic Substrings
#             |A little bit lazy to include these all here, but the laziness is
#             |because I don't want to copy and open all these templates in vim.
#             |This will call the substrings method on the string given, and
#             |finally return a call to select to verify which of the substrings
#             |are equal to their reverse.
# Code________|_______________________________________________________________|
#
def leading_substrings(str)
  results = []
  length_idx = 1
  loop do
    results << str.chars[0, length_idx].join('')
    length_idx += 1
    break if length_idx > str.size
  end
  results
end

def substrings(str)
  results = []
  start_idx = 0
  until start_idx >= str.length
    sub_str = str[start_idx..]
    results.concat(leading_substrings(sub_str))
    start_idx += 1
  end
  results
end

def palindromes(str)
  subs = substrings(str)
  subs.select! do |substr|
    #substr = substr.downcase.delete('^a-z') # further exploration!
    substr == substr.reverse if substr.length > 1
  end
  subs
end

# PART 1
# puts leading_substrings('abc') == ['a', 'ab', 'abc']
# puts leading_substrings('a') == ['a']
# puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
# PART 2
# puts substrings('abcde') == [
  # 'a', 'ab', 'abc', 'abcd', 'abcde',
  # 'b', 'bc', 'bcd', 'bcde',
  # 'c', 'cd', 'cde',
  # 'd', 'de',
  # 'e'
# ]
# PART 3
puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
