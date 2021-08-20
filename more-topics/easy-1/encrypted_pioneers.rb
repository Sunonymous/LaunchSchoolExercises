# Encrypted Pioneers

# P
#   Given a list of names encrypted by Rot13, decrypt the list.
# examples not provided
# Data: Array
# A
#   This method of encryption simply rotates the cipher by thirteen characters.
#   Write a helper function to wrap 13 characters around 26. Use the modulo
#     operator after adding thirteen to the original index.
#   Write a helper method to determine if the character is upper or lowercase.
#     It will do so by comparison with the letter vs the upcase/downcase methods,
#     and return :upcase or :downcase depending on which is true.
#     It will need an escape clause to prevent being confused by non-alphabetic
#     characters.
#       (This turned out not to be necessary.)
#   Iterate through the characters, checking case to obtain final callback
#     function. Adjust its index and append the adjusted-case character.
# C

names = ['Nqn Ybirynpr',
         'Tenpr Ubccre',
         'Nqryr Tbyqfgvar',
         'Nyna Ghevat',
         'Puneyrf Onoontr',
         'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
         'Wbua Ngnanfbss',
         'Ybvf Unvog',
         'Pynhqr Funaaba',
         'Fgrir Wbof',
         'Ovyy Tngrf',
         'Gvz Orearef-Yrr',
         'Fgrir Jbmavnx',
         'Xbaenq Mhfr',
         'Fve Nagbal Ubner',
         'Zneiva Zvafxl',
         'Lhxvuveb Zngfhzbgb',
         'Unllvz Fybavzfxv',
         'Tregehqr Oynapu']

ALPHABET = ('a'..'z').to_a

def wrap_thirteen_around_twenty_six(idx)
  (idx + 13) % 26
end

def which_case?(char)
  return :downcase if char.downcase == char

  :upcase if char.upcase == char
end

def print_key
  puts '-' * 68
  ALPHABET.each do |letter|
    print "#{letter}#{ALPHABET.index(letter) > 7 ? '  ' : ' '}"
  end
  puts
  (1..26).each { |number| print "#{number} " }
  puts
  print_shifted_alphabet
  puts '-' * 68
end

def print_shifted_alphabet
  shifted = ALPHABET.map { |let| adjust_letter(let) }
  shifted.each do |letter|
    print "#{letter}#{shifted.index(letter) > 7 ? '  ' : ' '}"
  end
  puts
end

def adjust_letter(letter)
  return letter unless ALPHABET.include?(letter)

  idx = ALPHABET.index(letter)
  ALPHABET[wrap_thirteen_around_twenty_six(idx)]
end

print_key

translated = names.map do |name|
  name.chars.map do |letter|
    method = which_case?(letter)
    adjust_letter(letter.downcase).send(method)
  end.join
end
puts translated
