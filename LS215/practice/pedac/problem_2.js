'use strict';

// Luhn Formula

// P
//   Validate whether or not a given number passes the Luhn formula.
//   To do so, starting from the last digit moving towards the first,
//     double every second digit.
//     If the doubled result exceeds nine, subtract nine.
//   Once those particular digits have been doubled, add all the digits together.
//   If the sum of the digits ends in a 0, the number is valid; otherwise, it is not.
//   Input  -> String of digits.
//   Output -> Boolean validity via Luhn formula.
//   Any non-numeric characters in the string may be ignored.
//   Supposedly, empty strings are invalid, as are strings containing no digits.
//   What is not known is whether or not 0 is a valid Luhn number.
//     Via the rules, it is, though it is not stated explicitly.
// Examples below code.
// D
//   Because position is significant in these calculations, using an array of numbers is ideal for certain steps in the calculation.
// A
//   Clean the input by removing all non-digit characters.
//   If the cleaned string is empty, return false.
//   Split the cleaned string into an array and map them into numbers and reverse it.
//   Map over this array, doubling the numbers at odd indices and subtracting 9 if the result exceeds nine.
//   Reduce via sum the resulting array.
//   Return true/false whether the remainder operator with 10 is 0.
// C

// thanks, last problem!
const filterCharacters  = (str, func) => str.split('').filter(func).join('');
const onlyDigits        = (c) => !!c.match(/\d/);
const subNineIfOverNine = (n) => n > 9 ? n - 9 : n;
const doubleN           = (n) => n * 2;
const isEven            = (n) => n % 2 === 0;
const sum               = (a, b) => a + b;
const divsEvenlyByTen   = (n) => n % 10 === 0;
const luhnPass          = (ns) => {
  return ns.reverse().map(Number).map((digit, idx) => {
    if (!isEven(idx)) {
      return subNineIfOverNine(doubleN(digit));
    } else {
      return digit;
    }
  })
}

const validLuhn = (numStr) => {
  numStr = filterCharacters(numStr, onlyDigits);
  if (numStr.length === 0) return false;
  const total = luhnPass(numStr.split('')).reduce(sum);
  return divsEvenlyByTen(total);
}

console.log('Part 1 - Test Results:');
console.log(!validLuhn('svdaiuwefa'));
console.log(validLuhn('afwainirens0'));
console.log(validLuhn('2323 2005 7766 3554'));
console.log(!validLuhn('1111'));
console.log(validLuhn('8763'));
console.log(validLuhn('204040'));
console.log(validLuhn('0'));
console.log(!validLuhn(''));
console.log(!validLuhn('5493'));

// Part Two -

// P
//   Write a function that can add a check digit to make the number valid per the Luhn formula
//     and return the original number plus that digit.
//   This should give '2323 2005 7766 3554' in response to '2323 2005 7766 355'.
// D
//   We can use an array to hold the digits for iteration/testing.
// A
//   Here we're operating based on the assumption that adding a single digit can create
//     a valid Luhn number.
//   I can only continue with the assumption that this is correct.
//   This is particularly weird because it changes the numbers which are doubled!
//   If this is so, then it is just a matter of iterating over 0-9, appending a digit
//     to the original string and returning the full string if it is valid via Luhn.
// C

const makeValidLuhn = (numStr) => {
  if (validLuhn(numStr)) return numStr;
  for (let i = 0; i < 10; i += 1) {
    if (validLuhn(numStr + i)) return numStr + i;
  }
}

console.log('\nPart 2 - Test Results:');
console.log(makeValidLuhn('') === '0');
console.log(makeValidLuhn('svdaiuwefa') === 'svdaiuwefa0');
console.log(makeValidLuhn('5493') === '54932');
console.log(makeValidLuhn('1111') === '11114');
console.log(makeValidLuhn('2323 2005 7766 3554') === '2323 2005 7766 3554');
