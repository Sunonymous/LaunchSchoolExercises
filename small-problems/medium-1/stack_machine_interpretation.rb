# Stack Machine Interpretation
#
# Problem     |---------------------------------------------------------------|
#             |Create a miniature stack-and-register-like programming language.
#             |
#       Input |Repeatedly given string commands to process.
#       Output|Result of such commands.
#       Edges |Empty inputs. Invalid inputs.
#             |For the purposes of the exercise, ignore invalid operations.
#       Rules |The program must accept and use the following commands: <num>,
#             |  PUSH, ADD, SUB, MULT, DIV, MOD, POP, PRINT
#             |Register should be initialized at 0.
#             |Operations requiring two operands use the register and the last
#             |  value from the register.
# Command List|
# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
#             |
#             |Commands may be given more than once in the input string.
#   Questions |What should be printed if a command is invalid? (Ignored)
#             |What should be done if an operation is invalid? (Ignored)
#             |
# Example     |---------------------------------------------------------------|
# minilang('PRINT') # 0
# minilang('5 PUSH 3 MULT PRINT') # 15
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT') # 5 # 3 # 8
# minilang('5 PUSH POP PRINT') # 5
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT') # 5 # 10 # 4 # 7
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ') # 6
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ') # 12
# minilang('-3 PUSH 5 SUB PRINT') # 8
# minilang('6 PUSH') # (nothing printed; no PRINT commands)
# Data        |---------------------------------------------------------------|
#             |Command string will be sorted into an array for processing.
#             |The stack itself is emulated as an array.
# Algorithm   |---------------------------------------------------------------|
#             |Create an empty array, 'stack'.
#             |Create a variable, 'register' and initialize it to 0.
#             |Sort the given strings into an array, split by spaces.
#             |For each command, check if it is an integer or a command.
#             |  If an integer, change the register value to reflect it.
#             |  If a command, perform the appropriate operation.
# Code________|_______________________________________________________________|
#
DIGITS = %w(- 0 1 2 3 4 5 6 7 8 9)
def is_num?(str)
  str.each_char do |char|
    return false if !DIGITS.include?(char)
  end
  true
end

def minilang(commands)
  stack = []
  register = 0
  process = commands.split(' ')
  process.each do |command|
    if is_num?(command)
      register = command.to_i
    else
      case command
      when 'PUSH'
        stack.push(register)
      when 'ADD'
        return "ERROR: Attempted to retrive value from empty stack!" if stack.empty?
        register += stack.pop
      when 'SUB'
        return "ERROR: Attempted to retrive value from empty stack!" if stack.empty?
        register -= stack.pop
      when 'MULT'
        return "ERROR: Attempted to retrive value from empty stack!" if stack.empty?
        register *= stack.pop
      when 'DIV'
        return "ERROR: Attempted to retrive value from empty stack!" if stack.empty?
        register /= stack.pop
      when 'MOD'
        return "ERROR: Attempted to retrive value from empty stack!" if stack.empty?
        register %= stack.pop
      when 'POP'
        return "ERROR: Attempted to retrive value from empty stack!" if stack.empty?
        register = stack.pop
      when 'PRINT'
        puts register
      else
        return "Invalid command <#{command}>"
      end
    end
  end
  nil
end

# minilang('PRINT') # 0
# minilang('5 PUSH 3 MULT PRINT') # 15
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT') # 5 # 3 # 8
# minilang('5 PUSH POP PRINT') # 5
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT') # 5 # 10 # 4 # 7
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ') # 6
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ') # 12
# minilang('-3 PUSH 5 SUB PRINT') # 8
# minilang('6 PUSH') # (nothing printed; no PRINT commands)
# minilang('5 PUSH 34 oops')
