// 1.
console.log('This document brought to you by the fabulous ' + 'Mr.' + ' ' + 'Sunny')

// 2.
let fullNumber = 4936
let ones = fullNumber % 10
let tens = ((fullNumber - ones) % 100) / 10
let hundreds = (fullNumber - ones - (tens * 10)) % 1000 / 100
let thousands = (fullNumber - ones - (tens * 10) - (hundreds * 100)) % 10000 / 1000
let reconstructedNumber = String(thousands) + hundreds + tens + ones
console.log(fullNumber === Number(reconstructedNumber))

// 3.
// string
// boolean
// number
// number
// undefined
// object

// 4.
// JS Implicitly coerces the second argument into a string and concatenates it with the first.

// 5.
console.log(Number('5') + 10)

// 6.
console.log(`The value of 5 + 10 is ${5 + 10}.`)

// 7.
let testArray = [42, 42, 42]
console.log(testArray[5])
// Nope! Just undefined.

// 8.
let petNames = ['Jasmine', 'Asterisk', 'Lonely Flip-Flop', 'Catastrophe', 'Bobby Tables']

// 9.
let pets = {
  petNames[0]: 'cricket',
  petNames[1]: 'dog',
  petNames[2]: 'lone wolf',
  petNames[3]: 'cat',
  petNames[4]: 'human-database-hybrid',
}

// 10.
// false

// 11.
// 3

// 12
// I guess it's true that '12' < '9'!
