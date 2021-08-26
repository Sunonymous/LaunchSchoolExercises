# Roman Numerals

# First the architecture.
# RomanNumeral is a class, taking an integer into its constructor. It has an
#   instance method to_roman, which returns the string roman numeral equivalent.

# P
#   Convert a decimal number into its roman numeral equivalent.
#   Numbers higher than 3000 will not be given.
# examples in test cases
# data: RomanNumeral class.
# A
#   We need a way to iterate through the number by tens. Maybe we could convert
#     the number to an array of characters. We could create a hash that holds
#     string values for the roman characters based on their value.
#   Iterating over the number array with the index could allow us to reference
#     the specific roman values based on the digit's position in the number.
#   The number 0 would have empty string representations on every value.
# C

# rubocop:disable Style/ClassVars
class RomanNumeral
  @@thousands = { 0 => '', 1 => 'M', 2 => 'MM', 3 => 'MMM' }
  @@hundreds = { 0 => '', 1 => 'C', 2 => 'CC', 3 => 'CCC', 4 => 'CD', 5 => 'D',
                 6 => 'DC', 7 => 'DCC', 8 => 'DCCC', 9 => 'CM' }
  @@tens = { 0 => '', 1 => 'X', 2 => 'XX', 3 => 'XXX', 4 => 'XL', 5 => 'L',
             6 => 'LX', 7 => 'LXX', 8 => 'LXXX', 9 => 'XC' }
  @@ones = { 0 => '', 1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V',
             6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX' }
  def initialize(num)
    raise ArgumentError, 'But... you said 3000 or less...' unless num <= 3000 &&
                                                                  num.is_a?(Integer)

    @decimal = num
  end
# rubocop:enable Style/ClassVars

  def to_roman
    digits = @decimal.digits.reverse
    length = digits.size
    roman = [@@thousands, @@hundreds, @@tens, @@ones][-length..-1]
    result = ''
    digits.each_with_index { |n, idx| result << roman[idx][n] }
    result
  end
end
