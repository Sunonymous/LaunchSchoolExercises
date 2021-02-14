# where to find docs?
# https://ruby-doc.org/

# while page
# https://ruby-doc.org/core-3.0.0/doc/syntax/control_expressions_rdoc.html#label-while+Loop

# while returns?
# returns `nil` unless a value is passed into `break`

# break returns?
# returns `nil` implicitly unless a value is passed to it

# large numbers
# ruby has class bignum which automatically receives values that overflow from float limits
# automatically converted between fixnums based on calculation result
# in ruby you can write _ instead of commas to separate longer numbers. these _ can go anywhere
# you may also use scientific notation, e.g. 1.5e10 to move the decimal right and 1.5e-10 to move it left
# https://ruby-doc.org/docs/ruby-doc-bundle/Tutorial/part_01/first_steps.html

# symbols
# :sunny or :"sunny"

# string class page
# https://ruby-doc.org/core-3.0.0/String.html

# right justification
# #rjust(len, padchar)

# upcase
# new = "xyz".upcase

# Array#insert
# a = %w(a b c d e)
# a.insert(3, 5, 6, 7)

# Optional Arguments
s = 'abc def ghi,jkl mno pqr,stu vwx yz'
#1 puts s.split.inspect
#2 puts s.split(',').inspect
#3 puts s.split(',', 2).inspect
#
#1 removes spaces
#   -> ["abc", "def", "ghi,jkl", "mno", "pqr,stu", "vwx", "yz"]
#2 removes commas
#   -> ['abc def ghi', 'jkl mno pqr', 'stu vwx yz']
#3 removes the first comma so that only two sections total are returned
#   -> ['abc def ghi', 'jkl mno pqr,stu vwx yz']