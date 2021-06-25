# Practice Problems Medium 1

# 1. Ben is right because he created an attribute reader for the balance 
#     instance variable. This means that balance without the @ will call the method
#     and return the instance variable's value.
# 2. Alan did not include an attribute writer for the quantity instance variable.
#     To solve the issue, include attr_accessor for :quantity and remove it from reader.
# 3. This will also allow the product name to be changed, unless the symbol is not
#     present in the accessor statement. This also removes any checks present in
#     the update_quantity method.
# 4. 
class Greeting
  def greet(greeting)
    puts greeting
  end
end

class Hello < Greeting
  def hi
    greet('Hello')
  end
end

class Goodbye < Greeting
  def bye
    greet('Goodbye')
  end
end

# 5. 
class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type || 'Plain'
    @glazing = glazing
  end
  def to_s
    @glazing.nil? ? "#{type}" : "#{type} with #{glaze}"
  end
  def type
    @filling_type
  end
  def glaze
    @glazing
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1
#  => "Plain"

# puts donut2
#  => "Vanilla"

# puts donut3
#  => "Plain with sugar"

# puts donut4
#  => "Plain with chocolate sprinkles"

# puts donut5
#  => "Custard with icing"

# 6. The first example sets the instance variable @template directly when the
#     method create_template is called. The second example is using the self
#     keyword, so it is calling the instance method obj#template= to set the
#     @template instance variable. Both examples use the instance method 
#     obj#template to read the @template variable.
#
# 7. Remove the word light from the method light_status so that you wouldn't
#     have to call Light.light_status.
