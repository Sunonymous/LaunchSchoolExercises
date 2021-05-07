# Tip Calculator
#
# Problem
#   Program asks for the bill amount and the tip percentage amount,
#     and returns the specified tip and total.
#   Input -> Bill as float, tip as integer percentage
#   Output -> Tip as float, total as float
#   Edge -> Tip outside of 0-100, bill less than 1.
#   Model -> Take the amount and multiply it by the tip percentage
#     to calculate the tip, and add the tip and the bill to get the
#     total bill.
# Example
#   Bill $200, Tip 15% >> Tip $30, Total $230
# Data Structure
#   N/A, just a calculation
# Algorithm
#   To get tip, use bill * (tip/100)
#   To get total, use bill + tip
# Code
#
def get_tip_percentage
  tip = nil
  puts "How much would you like to tip?"
  print "Enter a number (percentage) between 0 and 100\n>> "
  loop do
    tip = gets.chomp.to_f
    if tip < 0 || tip > 100
      print "Please enter a number between 0 and 100.\n>> "
      next
    else
      break
    end
  end
  tip / 100 # to use directly in calculation
end

def calculate_bill
  puts "Please, allow me to calculate your tip and total bill for you."
  puts "  (and may I just say, you are looking fabulous today!)"
  print "\nCould you tell me the amount on the bill you received?\n>> "
  bill_amount = nil
  loop do
    bill_amount = gets.chomp.to_f
    if bill_amount <= 0.0
      puts "You've either told me an incorrect amount or something zero or less..."
      puts "Everything is a tip on when the bill is free!"
      print "Could you give me the correct amount, please?\n>> "
      next
    else
      break
    end
  end
  puts "Thank you."
  tip_percent = get_tip_percentage()
  tip_amount = (bill_amount * tip_percent).round(2)
  total_bill = (bill_amount + tip_amount).round(2)
  puts "Wonderful. I am delighted to inform you that I have your total."
  puts "The amount of your tip is $#{format('%.2f', tip_amount)}, which takes your bill's total up to $#{format('%.2f', total_bill)}."
end

calculate_bill
