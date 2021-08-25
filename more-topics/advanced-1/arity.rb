# rubocop:disable Style/BlockComments, Style/FrozenStringLiteralComment
# Exploring Procs, Lambdas, and Blocks: Definition and Arity

# Group 1
=begin
my_proc = proc { |thing| puts "This is a #{thing}." }
my_proc_two = proc do |thing, thing2|
  thing2 ||= '[REDACTED]'
  puts "This is a #{thing}, and this is a #{thing2}."
  # return # returns from main? yikes!
end
my_useless_proc = proc { break }

puts my_proc
puts my_useless_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')
my_proc.call(%w[wombat cat])
my_proc_two.call('rat')
puts 'I will NOT appear.'
my_proc_two.call('cat', 'hat')
my_proc_two.call(%w[dis dat])
=end

# Group 2
=begin
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = ->(thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call('dingo')
my_third_lambda = ->(thing) { break; puts "This is a #{thing}." }
my_third_lambda.call('fig')
=end

# Group 3
=begin
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}." }
block_method_1('seal') { |amil| puts "Yo amo mi #{amil}." }
=end

# Group 4
=begin
def block_method_two(*animal)
  yield(*animal)
end

block_method_two('turtle') { |turtle| puts "This is a #{turtle}." }
block_method_two('turtle', 'seal') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_two('turtle') { |animal| puts "This is a #{animal}." }
# block_method_two('turtle') { |animal| puts "This is a #{animal}, #{greeting}." }
=end

##################
# OBSERVATIONS ##
##################

# Group1
# The standard string representation of a Proc contains a memory address,
#   and its location in the code, including file & line.
# Procs belong to the Proc class and may be created with `Proc.new { |x| x }`
#   or proc { |x| x } syntaxes.
# Procs may be called without matching arguments, ie. having lenient arity.
#   (Didn't test this again to verify, though unpassed arguments == nil)
# Procs may be provided with arguments during their invocation. If provided with
#   a single array argument, a proc will 'unpack' the array into separate values
#   if the proc body requires. Note that if a proc only requires a single param-
#   eter, the array is treated as a whole.

# Group2
# Lambdas are also objects of the Proc class. Lambda is NOT a class.
# Lambdas must be created using one of two syntaxes:
#   `lambda { |param| #code } `
#   `-> (params) { #code }`
# Their standard string representation contains the memory address, the filename
#   (without path) which contains them and their line number, and '(lambda)'.
# Lambdas must be called with the exact number of arguments stated in definition
#   ie. strict arity. This operates similar to methods.

# Group3
# Blocks must be yielded to inside of methods which contain a yield statement
#   in their method body.
# Even if the method accepts parameters, they are not passed to the block w/o
#   being explicitly passed after the yield statement.
#   Unpassed arguments are assigned nil in the block.
# Methods which contain an unconditional yield statement will not execute w/o
#   an implicit or explicit block present.

# Group4
# Blocks, similar to Procs, contain lenient arity, meaning that they may be
#   called with more or less arguments than defined inside themselves.
#   They will only make use of the arguments passed into the yield statement.
#     The others become nil.
# (Noting this online discovery for posterity. Blocks contain weird precedence
#   and may not end up where you want them to when chaining methods on a single
#   line. This is not great style anyway.)

##################
###   SUMMARY   ##
##################
# Blocks
# Class: N/A
# Arity: Lenient

# Procs
# Class: Proc
# Arity: Lenient

# Lambdas
# Class: Proc
# Arity: Strict

=begin
In comparation of blocks, procs, and lambdas, blocks and procs are the most
simliar. The primary difference between blocks and procs/lambdas is that blocks
are not objects, and instead part of the standard syntax for methods. Blocks and
procs both contain lenient arity, meaning that arguments are, ultimately,
optional. Excessive or missing arguments do not hinder the invocation and
exection of these, and missing values are assigned `nil`. What's more, a block
or a proc will unpack values given as an array into the appropriate values *as
dictated by the body of the block/proc definition*.
Procs and lambdas are members of the same class, the Proc class. One may test
whether or not a Proc is a lambda by using the instance method `Proc#lambda?`.
As stated, Procs have lenient arity, while lambdas are more similar to a method
in that they have strict arity. A lambda must be called with the exact number
of values that exist as parameters within the lambda's definition. Lambdas will
do no further processing to the variable arguments which they are given.
In terms of returning, Procs and Lambdas also differ. A return or break keyword
inside of a lambda will simply exit the lambda itself. A return or break inside
of a Proc will return from the context that the Proc is executed within. This
does not entirely align with what was read online, though returning from a Proc
which is invoked at top-level execution (main) appears to stop execution of the
program, without raising an exception, though a break statement executed at main
does raise a LocalJumpError. Returning or breaking from a lambda invoked at main
has no negative effect.
=end

# rubocop:enable Style/BlockComments, Style/FrozenStringLiteralComment
