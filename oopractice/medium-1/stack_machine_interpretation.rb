# Stack Machine Interpretation
# P
#   Write a class implementing a mini stack-and-register-based language with
#   the following commands:
#   `n`     - Place the value (n) in the register. Do not modify stack.
#   `PUSH`  - Push register value onto stack. Leave value in register.
#   `ADD`   - Pop a value from the stack and add & store it to the register.
#   `SUB`   - Pop a value from the stack & subtract it from the register value,
#               replacing the register value.
#   `MULT`  - Pop a value from the stack and multiply it by register value,
#               storing the result in the register.
#   `DIV`   - Pop a value from the stack and divide it into the register value,
#               storing the integer result in the register.
#   `MOD`   - Pop a value from the stack and divide it into the register value,
#               storing the integer remainder of the division into the register.
#   `POP`   - Remove the topmost item from the stack & place it in the register.
#   `PRINT` - Print the register value.
#
#   Rules -
#     All operations are integer operations.
#     Programs will be supplied as a string passed in as an argument.
#     Raise an exception if an unexpected item is given, or if a required value
#       is not present to complete an operation.
#     Terminate execution upon an exception.
#     Initialize the register at 0.
#   Questions -
#     Will eval need to be overridden?
# Examples Below
# D
#   Instance Variable @prompt (given at instantiation to provide the commands)
#   Instance Variable @register (to contain values; initialized at 0)
#   Instance Variable @stack    (to contain values; initalized as [] )
# A
#   The object will be created, provided a string of commands to execute.
#   Calling the `eval` method on the object will process the string.
#     First it splits the string by spaces to determine the commands.
#     Then for each command it will check to see if it matches the commands
#       available. If not, it will verify if the command is an integer.
#         If none of these are true, an exception is raised.
#       If the command matches a valid command, the command is sent/executed.
#         An exception is to be raised if there are not enough workable values.
#       If it is an integer, the value is placed into the register.
# C

class Minilang
  COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
  STACK_USAGE = %w(ADD SUB MULT DIV MOD POP)

  def initialize(commands)
    @register = 0
    @stack    = []
    @prompt   = commands
  end

  def verify_stack
    message = "Attempted usage of stack item on empty stack."
    raise StandardError, message if @stack.empty?
  end

  def PUSH;   @stack.push(@register);   end
  def ADD;    @register += @stack.pop;  end
  def SUB;    @register -= @stack.pop;  end
  def MULT;   @register *= @stack.pop;  end
  def DIV;    @register /= @stack.pop;  end
  def MOD;    @register %= @stack.pop;  end
  def POP;    @register = @stack.pop;   end
  def PRINT;  puts @register;  end

  def eval
    exe = @prompt.split
    process_commands(exe)
  end

  def process_commands(list)
    list.each do |command|
      if COMMANDS.include?(command)
        verify_stack if STACK_USAGE.include?(command)
        send(command) 
      elsif command.to_i.to_s == command
        @register = command.to_i
      else
        raise StandardError, "Invalid command `#{command}` failed to execute."
      end
    end
  end
end


# Test Cases / Examples
Minilang.new('PRINT').eval # 0
Minilang.new('5 PUSH 3 MULT PRINT').eval # 15
Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval # 5 # 3 # 8
Minilang.new('5 PUSH 10 PRINT POP PRINT').eval # 10 # 5
# Minilang.new('5 PUSH POP POP PRINT').eval # Empty stack!
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval # 6
Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval # 12
# Minilang.new('-3 PUSH 5 XSUB PRINT').eval # Invalid token: XSUB
Minilang.new('-3 PUSH 5 SUB PRINT').eval # 8
Minilang.new('6 PUSH').eval # (nothing printed; no PRINT commands)
