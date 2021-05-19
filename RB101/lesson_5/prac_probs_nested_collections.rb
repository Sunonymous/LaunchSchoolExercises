# Practice Problems - Sorting, Nested Collections and Working With Blocks
# 1) Order this array by descending numeric value.
arr = ['10', '11', '9', '7', '8']
arr.sort! do |a, b|
  b.to_i <=> a.to_i
end
arr
#
# 2) Order this array of hashes based on the year of publication, from
#    earliest to lastest.
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]
books.sort_by! do |book|
  book[:published].to_i # I guess .to_i is not needed.
end
books

# 3) Demonstrate how you would access the letter 'g' in each of the following:
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# p arr1[2][1][3]
# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# p arr2[1][:third][0]
# arr3 = [['abc'], ['def'], {third: ['ghi']}]
# p arr3[2][:third][0][0]
# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# p hsh1['b'][1]
# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# p hsh2[:third].keys[0]

# 4) In each of these collections where 3 occurs, change it to 4. 
arr1 = [1, [2, 3], 4]
# Quick thoughts:
# Iterate through outer level, using map to return a new array.
# Check if element is integer or Array
# If Integer, change to 4 if value is three
# If Array, begin second map iteration
# If 2nd Level integer is 3, change it to 4
(arr1.map do |l1Elem|
  if l1Elem.to_s.length == 1
    l1Elem = 4 if l1Elem == 3
    l1Elem
  # else
    # l1Elem.map do |l2Elem|
      # l2Elem = 4 if l2Elem == 3
      # l2Elem
    # end
  end
end)
# Overview:
# arr2 is an array with three elements, two hashes and an integer
# Because the hashes do not contain the value three, ignore them
# Test if element is a hash, and if so, return it to the block
# If not, test if 3 and if so, change to 4.
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
(arr2.map do |elem|
  elem = 4 if elem.to_s.length == 1 && elem == 3 #if int
  elem
end)
# Overview:
# hsh1 is a hash with a single key whose value is an array with three elements,
#   the third being an array with a single integer
# Because we want to return a hash, if we call map, we have to cast it to_h again
# Call map on hash returns [[:first, [1, 2, [3]]]]
# Call map on elements in hsh1 (arrays of key-value pairs)
# I stopped writing here because it was challenging to get this deep without 
# working through it manually.
hsh1 = {first: [1, 2, [3]]}
(hsh1.map do |hshArray|
  hshArray.map do |keyvalEm|
    if keyvalEm.class == Array
      keyvalEm.map do |innerEm|
        if innerEm.class == Array
          innerEm.map { |em| em == 3 ? 4 : em }
        else
          innerEm == 3 ? 4 : innerEm
        end
      end
    else
      keyvalEm
    end
  end
end.to_h)
# Overview
# hsh2 is a hash with two keys
# Thinking further (after the last problem), we only need to modify values, not keys.
# So calling map on hsh2, we only need to concern ourselves with the second element
# in each key-value array.
# I'm gonna do this one manually. It's too strange and too convoluted to iterate here.
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
(hsh2)
# 5) Given this hash, determine the total age of the male members of the family:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
male_munsters = munsters.select do |_, munster|
  munster['gender'] == 'male'
end
total_age = male_munsters.values.map {|hash| hash['age']}.reduce(:+)
total_age

# 6) Print out each munster in the following format:
# (Name) is a (age)-year-old (male or female).
munsters.each do |name, details|
  #puts "#{name} is a #{details['age']}-year-old #{details['gender']}."
  name
  details
end

# 7) a = 2, b = [3, 8]
# Outline:
# a is assigned to integer 2
# b is assigned to an array of [5, 8]
# arr is assigned to an array of [a, b] which results to [2, [5, 8]]
# The first element of arr is incremented by 2, and arr becomes [4, [5, 8]]
# The first element of the second element of arr is lowered by 2
#   and arr becomes [4, [3, 8]]
# a remains 2 because it was never reassigned
# b becomes [3, 8]

# 8) Using `each`, output all of the vowels in the strings.
VOWELS = %w(a e i o u)
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
hsh.each do |_, value|
  value.each do |word|
    word.each_char { |c| print c if VOWELS.include?(c) && false } ### Remove false to re-enable!!
  end
end

# 9) Given this data structure, return a new array with each sub-array sorted in
#    descending order alphabetically or numerically.
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
(arr.map do |subarray|
    subarray.sort do |a, b|
      b <=> a
    end
end)

# 10) Given the following data structure, return an identical array with each 
#     integer incremented by one, without modifying the original array.
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
# Thoughts
# Without modifying the array? Can I modify the hash objects?
(arr.map do |hash|
  new = hash.dup
  new.each_key do |key|
    new[key] += 1
  end
  new
end)

# 11) Given the following data structure, use `select` or `reject` to return a
#     new array with identical structure, yet containing only integers that are
#     multiples of three.
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
(arr.map do |subarray|
  subarray.select do |int_elem|
    int_elem % 3 == 0
  end
end)
(arr.map do |subarray|
  subarray.reject do |int_elem|
    int_elem % 3 != 0
  end
end)

# 12) Given the following data structure, and without using `to_h`, write code
#     to return a hash where the key is the first item in the subarrays and the
#     value is the second item.
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
new_hash = {}
arr.each do |subarray|
  new_hash[subarray[0]] = subarray[1]
end
new_hash == {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# 13) Given the following data structure, return a new array containing the same
#     subarrays as the original, but sorted by odd numbers only.
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
(arr.sort_by do |subarray|
  subarray.reject do |num|
    num.even?
  end
end)

# 14) Given the following data structure, return an array containing the colors
#     of the fruits and the sizes of the vegetables. Size should be UPPERCASE
#     and colors should be capitalized.
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
(hsh.map do |_, plant|
  case plant[:type]
  when 'fruit'
    plant[:colors].map {|color| color.capitalize}
  when 'vegetable'
    plant[:size].upcase
  end
end)

# 15) Given the following data structure, return an array containing only the
#     hashes which contain all even integers.
# Thoughts
# We need to iterate over the hashes and remove those that have odd integers.
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
p (arr.select do |hash|
  rejects = []
  hash.each_value do |array|
    array.each { |num| rejects << num if num.odd? }
  end
  rejects.size == 0
end)
# Originally I was trying to use `#all?` like in the given solution, though the
# nested arrays were confusing the issue, like it says.
p (arr.select do |hash|
  hash.all? do |_, val|
    val.all? do |n|
      n.even?
    end
  end
end)

# 16) Write a method which returns one UUID as a string when called without parameters.
#
def make_UUID
  add_dash_at = [8, 13, 18, 23]
  uuid = ''
  until uuid.length == 36
    uuid << '-' if add_dash_at.include?(uuid.length)
    uuid << "#{rand(0..15).to_s(16)}"
  end
  uuid
end
puts make_UUID
require 'securerandom'
puts SecureRandom.uuid # merely curious here
