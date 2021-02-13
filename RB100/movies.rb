movies = {
	"Sunshine" => 1923,
	"Ogre" => 2001,
	"Dollop" => 1234
}

array = []

movies.each {|k,v| array.push v}
array.each {|v| puts v}
