# Grade Book
#
# Problem     |---------------------------------------------------------------|
#             |Given three scores of 0-100, return the letter grade of their
#             |average score.
#       Input |Three scores from 0 to 100
#       Output|A string A, B, C, D, or F
#       Edges |No input validation necessary
#       Rules |Average scores between 0 and 59 are Fs.
#             |Average scores between 60 and 69 are Ds.
#             |Average scores between 70 and 79 are Cs.
#             |Average scores between 80 and 89 are Bs.
#             |Average scores between 90 and 100 are As.
#   Questions |
# Example     |---------------------------------------------------------------|
# get_grade(95, 90, 93) == "A"
# get_grade(50, 50, 95) == "D"
# Data        |---------------------------------------------------------------|
#             |N/A
# Algorithm   |---------------------------------------------------------------|
#             |Calculate the average of the three given scores.
#             |Return the corresponding letter equivalent.
# Code________|_______________________________________________________________|
#
def get_grade(score1, score2, score3)
  case (score1 + score2 + score3) / 3
  when 0..59 then 'F'
  when 60..69 then 'D'
  when 70..79 then 'C'
  when 80..89 then 'B'
  when 90..100 then 'A'
  when 101.. then 'A+'
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
puts get_grade(99, 105, 102) == "A+"
