# Rock, Paper, Scissors!
#
VALID_CHOICES = %w(rock paper scissors)

def calculate_winner(player, computer)
  order = ['rock', 'paper', 'scissors']
  match = case player
          when 'rock'
            ['tie', 'lose', 'win']
          when 'paper'
            ['win', 'tie', 'lose']
          when 'scissors'
            ['lose', 'win', 'tie']
          end
  match[order.index(computer)]
end

def display_results(result)
  win_string = case result
               when 'win'
                 "You won!"
               when 'lose'
                 "You have lost."
               when 'tie'
                 "The match is a stalemate."
               end
  prompt(win_string)
end

def prompt(message)
  puts "=> #{message}"
end

prompt("Welcome to Rock, Paper, Scissors!")
loop do
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  choice = nil
  loop do
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    print "Invalid choice! Please try again.\n>> "
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}. Computer chose #{computer_choice}.")

  display_results(calculate_winner(choice, computer_choice))

  prompt("Would you like to play again? (y/n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt("Thank you for playing!")
