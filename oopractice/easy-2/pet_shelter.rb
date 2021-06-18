# Pet Shelter

class Pet
  def initialize(species, name)
    @species = species
    @name = name
  end

  def to_s
    "a #{@species} named #{@name}"
  end
end

class Owner
  attr_reader :name, :number_of_pets
  def initialize(name)
    @name = name
    @number_of_pets = 0
    @pets = []
  end

  def add_pet(pet)
    @number_of_pets += 1
    @pets.push(pet)
  end

  def print_number_of_pets
    "#{name} has #{number_of_pets} adopted pets."
  end
  
  def to_s
    self.name
  end
end

class Shelter
  def initialize
    @adoptions = Hash.new { |hash, key| hash[key] = [] }
    @roster = []
  end

  def shelter_pet(pet)
    @roster.push(pet)
  end

  def adopt(new_owner, pet)
    if @roster.include?(pet)
      self.adoptions[new_owner].push(pet)
      new_owner.add_pet(pet)
      @roster.delete(pet)
    else
      puts "The pet requested is not present in the Animal Shelter."
    end
  end

  def print_sheltered_pets
    puts "The Animal Shelter has the following unadopted animals:"
    @roster.each { |pet| puts pet }
    puts "(All animals are adopted! Yay!)" if @roster.size == 0
    puts
  end

  def print_adoptions
    @adoptions.each do |owner, pets|
      puts "#{owner} has adopted the following pets:"
      pets.each { |pet| puts pet }
      puts
    end
  end

  private

  attr_accessor :adoptions
end

system('clear')
butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
keebee       = Pet.new('dog', 'KeeBee')
izzybee      = Pet.new('dog', 'IddaBee')
sweetie2     = Pet.new('dog', 'Sweetie')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
gjudy   = Owner.new('G Judy')
smarz   = Owner.new('S Marz')

shelter = Shelter.new

shelter.shelter_pet(butterscotch)
shelter.shelter_pet(pudding)
shelter.shelter_pet(darwin)
shelter.shelter_pet(kennedy)
shelter.shelter_pet(sweetie)
shelter.shelter_pet(molly)
shelter.shelter_pet(chester)
shelter.shelter_pet(keebee)
shelter.shelter_pet(izzybee)
shelter.shelter_pet(sweetie2)
shelter.print_sheltered_pets

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(gjudy, izzybee)
shelter.adopt(smarz, keebee)
shelter.adopt(smarz, sweetie2)
shelter.print_adoptions
puts "\n" * 3
shelter.print_sheltered_pets

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{gjudy.name} has #{gjudy.number_of_pets} adopted pets."
puts "#{smarz.name} has #{smarz.number_of_pets} adopted pets."

