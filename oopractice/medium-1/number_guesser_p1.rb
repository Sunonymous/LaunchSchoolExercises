# Number Guesser Part One

# P
#   Create a number guessing game for numbers between 1 and 100, with a 7-guess
#     limit per game. The code should use OOP structure.
# Examples omitted for brevity.
# D
#   GuessingGame (Class)
#   --> State
#     GUESS_LIMIT = 7
#     LOW_LIMIT = 1
#     HIGH_LIMIT = 100
#     @target = random_number between LOW_LIMIT and HIGH_LIMIT
#     @guesses_remaining = 7
#   --> Methods
#     play - to coordinate game loop
#     guess - to get a guess from user
#     check_guess - to validate user submission
#     respond - to alert user to the result
#     correct? -  Will return true / false if target number was guessed
#
# A
#   This game will be designed with little configurability, using many constants.
#   All methods are private except play.
#   The object is instantiated and play is called.
#   Play creates local variable submission, sets @guesses_remaining to
#       GUESS_LIMIT, and starts a loop
#     If @guesses remaining is greater than 0, call the guess method and assign
#       its return value to local variable submission.
#     If correct?, then break out of the loop.
#     Otherwise, respond.
#   If correct? congratulate the user, otherwise announce their loss.
# C

class GuessingGame
  GUESS_LIMIT = 7
  LOW_LIMIT = 1
  HIGH_LIMIT = 100
  
  def initialize
    @target = rand(LOW_LIMIT..HIGH_LIMIT)
    @guesses_remaining = GUESS_LIMIT
    @guess = nil
  end

  def play
    reset
    puts "A number has been selected within #{LOW_LIMIT} and #{HIGH_LIMIT}."
    puts "You have #{GUESS_LIMIT} attempts to guess this number."
    until @guesses_remaining <= 0
      @guess = guess
      break if correct?
      respond
      @guesses_remaining -= 1
    end
    puts correct? ? 'You guessed the number!' : 'You have no more guesses.'
    puts "The number selected was #{@target}. You #{correct? ? 'win' : 'lose'}!"
  end

  private

  def reset
    @target = rand(LOW_LIMIT..HIGH_LIMIT)
    @guesses_remaining = GUESS_LIMIT
    @guess = nil
  end

  def guess
    prompt = "Please provide me a number from #{LOW_LIMIT} to #{HIGH_LIMIT}: "
    loop do
      print(prompt)
      choice = gets.chomp.to_i
      return choice if choice.between?(LOW_LIMIT, HIGH_LIMIT)
      print('Invalid guess. ')
    end
  end

  def respond
    puts "The number selected is lower than your guess." if @guess > @target
    puts "The number selected is higher than your guess." if @guess < @target
    case @guesses_remaining
    when 2 then puts "This is your final guess."
    when 1 then ''
    else puts "You have #{@guesses_remaining - 1} guesses remaining."
    end
    puts
  end

  def correct?
    @guess == @target
  end
end

system('clear')
game = GuessingGame.new
game.play
