# Arithmetic Integer
#
# Problem
#   Given two positive integers, display results of using
#     them as operands of +, -, *, /, %, **.
# Example
#   23, 17 => 40, 6, 391, 1, 6, 141050039560662968926103
# Data Structure
#   N/A
# Algorithm
#   Perform the calculations on the inputs given.
# Code
#
def prompt(message)
  puts "~~| #{message} |~~"
end

def grab_number
  num = nil
  loop do
    prompt('Please provide me a positive number.')
    print('>>  ')
    num = gets.chomp.to_i
    break unless num.positive?

    prompt('Your integer must be positive and valid!')
    next
  end
  num
end

num1 = grab_number
num2 = grab_number
prompt('***********************************')
prompt('              RESULTS              ')
prompt('***********************************')
prompt("#{num1} + #{num2} = #{num1 + num2}")
prompt("#{num1} - #{num2} = #{num1 - num2}")
prompt("#{num1} * #{num2} = #{num1 * num2}")
prompt("#{num1} / #{num2} = #{num1 / num2}")
prompt("#{num1} % #{num2} = #{num1 % num2}")
prompt("#{num1} ** #{num2} = #{num1**num2}")
prompt('***********************************')
