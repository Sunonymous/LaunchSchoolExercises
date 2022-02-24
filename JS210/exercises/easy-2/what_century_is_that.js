// What Century is That?

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

// given a year, return the century
// word endings:
//   1st
//   2nd
//   3rd
//   4th...20th
//  21st
//  32nd
// logic:
//   if word ends in 1 && not 11, then 'st' otherwise 'th'
//   if ends in 2 && not 12, then 'nd' otherwise 'th'
//   if ends in 3 && not 13, then 'rd' otherwise 'th'

const endsInX = x => n => String(n).endsWith(x);
const endsIn1 = endsInX('1');
const endsIn2 = endsInX('2');
const endsIn3 = endsInX('3');
const atLeastTwoDigits = n => String(n).length > 1;
const secondToLastDigitIs1 = n => {
  const cast = String(n);
  if (cast.length <= 1) return false;
  return cast[cast.length - 2] === '1';
}

const wordEndings = num => {
  if (endsIn1(num) && !secondToLastDigitIs1(num)) {
    return 'st';
  } else if (endsIn2(num) && !secondToLastDigitIs1(num)) {
    return 'nd';
  } else if (endsIn3(num) && !secondToLastDigitIs1(num)) {
    return 'rd';
  } else {
    return 'th';
  }
}

// to test endings
// range(50, 0).map(n => n + wordEndings(n)).map(n => console.log(n));

// looking at results...
// can we year % 100 + the remainder?
// noooope
// not sure of an easy way to calculate and it's getting kind of hacky in my head

function century(year) {
  let century;
  if (year < 1) {
    return null;
  } else if (year < 101) {
    century = 1;
  } else {
    if (year % 100 === 0) {
      century = year / 100;
    } else {
      century = Math.floor(year / 100) + 1;
    }
  }
  return century + wordEndings(century);
}

// yup, pretty hacky

console.log('Test Results:');
console.log(century(2000)  === '20th');        // "20th"
console.log(century(2001)  === '21st');        // "21st"
console.log(century(1965)  === '20th');        // "20th"
console.log(century(256)   === '3rd');         // "3rd"
console.log(century(5)     === '1st');           // "1st"
console.log(century(10103) === '102nd');       // "102nd"
console.log(century(1052)  === '11th');        // "11th"
console.log(century(1127)  === '12th');        // "12th"
console.log(century(11201) === '113th');       // "113th"

// wow, the LS solution was a lot more elegant than this
