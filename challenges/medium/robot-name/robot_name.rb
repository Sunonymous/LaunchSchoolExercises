# Robot Name

# Architecture
# Robot is a class with a (assumed reader) instance method Robot#name and
#   another instance method Robot#reset, which generates a new name.

# P
#   Robots receive a randomly generated name each time one is created.
#   Robots can #reset to receive a new name.
#   Names may not be used twice, even if a robot is reset.
# examples in test cases
# data classes and arrays
# A
#   Generate a random sequence of two letters and three numbers to create a name.
#   If the name does not exist in the archive of previous names, it is acceptable.
#     If so, it may be assigned to the instance variable @name and added to the archive.
#     Otherwise, generate a new name.
#   When a robot is reset, generate it a new name.
# C

class Robot
  attr_reader :name

  ARCHIVE = []

  def initialize
    reset
  end

  def reset
    @name = generate_name
  end

  def generate_name
    name = nil
    loop do
      name = gen_letter + gen_letter + gen_number
      break unless ARCHIVE.include?(name)
    end
    ARCHIVE.push(name)
    name
  end

  def gen_letter
    ('A'..'Z').to_a.sample
  end
 
  def gen_number
    num = (0..999).to_a.sample
    case num
    when 0..9 then "00#{num}"
    when 10..99 then "0#{num}"
    else num.to_s
    end
  end
end
