require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Calculator!
#
# Ask the user for two numbers.
# Ask the user for an operation to perform.
# Perform the operation on the two numbers.
# Output the result.
#

def prompt(message)
  puts "=> #{message}"
end

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def contains_period?(num)
  num.include?('.')
end

def valid_number?(num)
  return num.to_f.to_s == num if num.include?('.')
  num.to_i.to_s == num
end

def cast_number_string(x)
  if x.include?('.')
    Float(x)
  else
    Integer(x)
  end
end

def operation_to_message(op)
  result = case op
           when '1'
             'Adding'
           when '2'
             'Subtracting'
           when '3'
             'Multiplying'
           when '4'
             'Dividing'
           end
  result
end

prompt(messages('introduction'))
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(messages('invalid_name'))
  else
    break
  end
end

prompt(format(messages('greeting'), name: name))

loop do # main loop
  numbers = []

  loop do
    prompt(messages('get_number1'))
    number1 = gets.chomp
    if valid_number?(number1)
      numbers.push(number1)
      break
    else
      prompt(messages('invalid_number'))
    end
  end
  number2 = ''
  loop do
    prompt(messages('get_number2'))
    number2 = gets.chomp
    if valid_number?(number2)
      numbers.push(number2)
      break
    else
      prompt(messages('invalid_number'))
    end
  end

  numbers.map! { |em| cast_number_string(em) }

  prompt(messages('choose_operator'))

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('invalid_operator'))
    end
  end

  result = case operator
           when '1'
             numbers.reduce(:+)
           when '2'
             numbers.reduce(:-)
           when '3'
             numbers.reduce(:*)
           when '4'
             numbers.reduce(:/)
           end

  operators = ['+', '-', '*', '/']
  calculation = "#{numbers[0]} #{operators[operator.to_i - 1]} #{numbers[1]}"
  prompt(format(messages('confirmation'), calculation: calculation))
  prompt(format(messages('result'), result: result))

  prompt(messages('play_again'))
  answer = gets.chomp
  break unless answer.downcase.start_with?(messages('choice_yes'))
end

prompt(messages('goodbye'))
