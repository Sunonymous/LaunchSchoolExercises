# Number Guesser Part One

class GuessingGame
  def initialize(low_limit, high_limit)
    @low_limit = low_limit
    @high_limit = high_limit
    @guess_limit = calculate_guess_limit
    reset
  end

  def calculate_guess_limit
    number_range = (@low_limit..@high_limit).to_a.size
    @guesses_remaining = Math.log2(number_range).to_i + 1
  end

  def play
    reset
    puts "A number has been selected within #{@low_limit} and #{@high_limit}."
    puts "You have #{@guess_limit} attempts to guess this number."
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
    @target = rand(@low_limit..@high_limit)
    @guesses_remaining = @guess_limit
    @guess = nil
  end

  def guess
    prompt = "Please provide me a number from #{@low_limit} to #{@high_limit}: "
    loop do
      print(prompt)
      choice = gets.chomp.to_i
      return choice if choice.between?(@low_limit, @high_limit)
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
game = GuessingGame.new(1, 1000000)
game.play
