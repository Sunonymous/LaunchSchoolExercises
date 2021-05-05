# Pseudo-Code!
#
# 1. a method that returns the sum of two integers
# Casual
# Given two integers, number1 and number2.
# Return the sum of number1 and number2.
#
# Formal
# START
# number1 + number2
# END
#
# 2. a method that takes an array of strings, and returns a string that is all those strings concatenated together
# Casual
# Given an array of strings, arr.
# Create a string, results.
# Iterate through arr and append each element to results.
# Return results.
#
# Formal
# START
# SET idx = 0
# SET result = ""
# WHILE idx < READ arr.length
#   SET result = result + arr element at index idx
#   SET idx = idx + 1
# PRINT result
# END
#
# 3. a method that takes an array of integers, and returns a new array of every other element
# Casual
# Given array arr.
# Create a variable, result.
# Iterate through arr, and add the elements at odd (or even, exclusively) indices to result.
#
# Formal
# START
# SET idx = 0
# SET result = []
# WHILE idx < READ arr.length
#   IF idx is odd
#     SET result = result + arr[idx]
# PRINT result
# END
