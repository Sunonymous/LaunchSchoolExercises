# Loan Calculator
#
# Problem
#   Build a loan calculator using a predefined formula
#   Input -> loan amount, APR, loan duration
#   Output -> Monthly interest rate, Loan Duration (mo.), Monthly payment
#   Edges -> Unconcerned about input validation
# Example
#   Given website to verify answers, but no examples were given.
# Data Structure
#   N/A, uses a formula and calculation
# Algorithm
#   monthly_payment = loan_amount * (monthly_interest_rate /
#     (1 - (1 + monthly_interest_rate )**(-duration_in_months)))
# Code
#
def display_val(amt)
  "$#{format('%.2f', amt)}"
end

def get_dollar_amount
  amt = nil
  print "What is the loan amount?\n>> "
  loop do
    amt = gets.chomp.to_f
    if amt <= 0.0
      print "Please enter a valid amount.\n>> "
      next
    else
      break
    end
  end
  amt
end

def get_percentage_via_float
  amt = nil
  print "What is the Annual Percentage Rate of interest of this loan?\n>> "
  loop do
    amt = gets.chomp.to_f
    if amt <= 0 || amt > 100
      print "Please enter a number between 0 and 100.\n>> "
      next
    else
      break
    end
  end
  amt
end

def get_number_of_months
  duration_months = nil
  print "How many months will this loan last?\n>> "
  loop do
    duration_months = gets.chomp.to_i
    if duration_months <= 0
      print "Loans last at least one month. Enter a positive integer.\n>> "
      next
    else
      break
    end
  end
  duration_months
end

def calc_monthly_payment(loan, m_interest, duration)
  loan * (m_interest / (1 - (1 + m_interest)**(-duration)))
end

# START
loan_amount = get_dollar_amount
apr_decimal = (get_percentage_via_float / 100.0).round(4)
duration_months = get_number_of_months
monthly_interest_rate = (apr_decimal / 12.0).round(6) # months in year
monthly_payment = calc_monthly_payment(loan_amount,
                                       monthly_interest_rate,
                                       duration_months)
total_cost = monthly_payment * duration_months
puts "\nLoan Amount: #{display_val(loan_amount)}"
puts "Duration: #{duration_months} months"
puts "Annual Percentage Rate (APR) #{apr_decimal * 100}%"
puts "Monthly Interest Rate: #{monthly_interest_rate}%"
puts "Monthly Payment: #{display_val(monthly_payment)}"
puts '--------------------------------------'
puts "Final Cost: #{display_val(total_cost)}"
# END

# Afterthoughts
# I could refactor the getting methods into a single one,
#   though I would need some extra arguments
#   to specify either a collection mode or to supply the boundaries.
# Annoyingly, rubocop didn't like my program having so many methods together.
# Instead of using global variables, I just took all the stuff
# module itself.
