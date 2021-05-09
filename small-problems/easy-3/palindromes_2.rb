# Palindromes 2
#
def palindrome?(string)
  string == string.reverse
end

def ditch_non_letters(string)
  upper = ('A'..'Z')
  lower = ('a'..'z')
  nums = (0..9)
  results = ""
  string.each_char do |char|
    results << char if upper.include?(char) ||
                       lower.include?(char) ||
                       nums.include?(char)
  end
  results
end

def real_palindrome?(string)
  palindrome?(ditch_non_letters(string.downcase))
end

