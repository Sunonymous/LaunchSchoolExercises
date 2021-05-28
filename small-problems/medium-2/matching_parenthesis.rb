# Matching Parentheses?
#
# Problem     |---------------------------------------------------------------|
#             |Given a string, return true or false based on whether all the
#             |parentheses in the string are matched, by order and count.
#       Input |A string
#       Output|True or false based on whether the parentheses are balanced.
#       Edges |Empty strings (ignored).
#             |Out of order parentheses.
#       Rules |Parentheses must be equal in count and in logical order to 
#             |  evaluate as true.
#   Questions |
# Example     |---------------------------------------------------------------|
# balanced?('What (is) this?') == true
# balanced?('What is) this?') == false
# balanced?('What (is this?') == false
# balanced?('((What) (is this))?') == true
# balanced?('((What)) (is this))?') == false
# balanced?('Hey!') == true
# balanced?(')Hey!(') == false
# balanced?('What ((is))) up(') == false
# Data        |---------------------------------------------------------------|
#             |Possibly sorting into temporary arrays.
# Algorithm   |---------------------------------------------------------------|
#             |Return false if the count of ( and ) are unequal.
#             |Create two variables, open_index and closing_index, at nil
#             |Duplicate the string into copy_string.
#             |Start a loop while the copy_string includes '('
#             |  Iterate through the characters in copy string.
#             |    If char is ), return false.
#             |    If char is (, set open_index to the index of char.
#             |    If char is ) and open_index is not nil, set closing_index to
#             |      the index of char.
#             |  If open_index is !nil and closing_index is nil, return false.
#             |  Delete the characters at index open_index and closing_index.
#             |  Set open_index and closing_index to nil.
#             |Return true.
# Code________|_______________________________________________________________|
#
def balanced?(str)
  return false if str.count('(') != str.count(')')
  copy_string = str.clone
  while copy_string.include?('(')
    open_index, closing_index = nil
    copy_string.each_char do |char|
      return false if char == ')' && open_index.nil?
      open_index = copy_string.index(char) if char == '('
      closing_index = copy_string.index(char) if char == ')'
    end
    return false if !open_index.nil? && closing_index.nil?
    copy_string[open_index] = ''
    copy_string[closing_index] = ''
  end
  true
end

def balanced?(str)
  open_characters = ['\'', '“', '(', '[', '{']
  close_characters = ['\'', '”', ')', ']', '}']
  balance = 0
  str.each_char do |char|
    balance += 1 if open_characters.include?(char)
    balance -= 1 if close_characters.include?(char)

    return false if balance < 0
  end
  balance.zero?
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
