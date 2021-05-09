# Palindromes 3
#
def palindrome?(string)
  string == string.reverse
end

def palindromic_number?(num)
  palindrome?(num.to_s)
end

# I played around with removing leading zeroes, and wasn't successful...
