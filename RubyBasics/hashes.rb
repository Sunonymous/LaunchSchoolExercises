# first car
#car = {type: "sedan", color: 'blue', mileage: 80_000}
# they used expanded formatting, so I'll do it too to practice the alignment
car = {
	type:       'sedan',
	color:      'blue',
	mileage:    80_000
} # so pretty

# adding the year
car[:year] = 2003


# broken odometer
car.delete(:mileage)
#p car


# what color?
#puts car[:color]


# labeled numbers
numbers = {
  high:   100,
  medium: 50,
  low:    10
}
#numbers.each {|k,v| puts "A #{k} number is #{v}."}


# divided by two
half_numbers = numbers.map {|k,v| v/2}
#p half_numbers


# low, medium, or high?
low_numbers = numbers.select {|k,v| v < 25}
#p low_numbers


# low or nothing
low_numbers = numbers.select! {|k,v| v < 25}
# this changes both hashes
#p numbers
#p low_numbers


# multiple cars
vehicles = {
	car: {
		type:  'sedan',
		color: 'blue',
		year:  2003
	},
	truck: {
		type:  'pickup',
		color: 'red',
		year:  1998
	}
}
# lol I wrote it vertically this time and they wrote it horizontally...
# discrepancies!


# which collection?
carr = [[:type, 'sedan'], [:color, 'blue'], [:year, 2003]]