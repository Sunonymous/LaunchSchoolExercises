# What's My Bonus?
#
# Problem
#   Input -> +Int, Boolean Flag
#   Output -> Int, 0 or half Input
#   Edge -> Negative Numbers
#   Model: The flag determines whether or not the calculation is made.
#     If so, it returns half the salary. If not, zero.
# Example
#   calculate_bonus(2800, true) == 1400
#   calculate_bonus(1000, false) == 0
#   calculate_bonus(50000, true) == 25000
# Data Structure
#   N/A, Just a calculation.
# Algorithm
#   Check for positive input.
#   Use a ternary to check flag status. If true, half the salary.
# Code
#
def calculate_bonus(salary, bonus)
  raise ArgumentError.new "Salary must be more than zero." if salary <= 0
  (bonus) ? salary / 2 : 0
end
