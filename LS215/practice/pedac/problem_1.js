'use strict';

// Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages.
// Other than digits, the number may also contain special character such as spaces, dash, dot,
// and parentheses that should be ignored.

// The rules are as follows:

// If the phone number is less than 10 digits, assume that it is a bad number.
// If the phone number is 10 digits, assume that it is good.
// If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
// If the phone number is 11 digits and the first number is not 1, then it is a bad number.
// If the phone number is more than 11 digits, assume that it is a bad number.
// For bad numbers, just a return a string of 10 0s.

// P
//   Input:  String of digits and potentially additional symbols.
//   Output: String of ten digits
//
//   Given a string containing (supposedly) a phone number, validate the number and
//     return the string stripped of any non-digit characters, or the string '0000000000' if the given number is not valid.
// Examples Below
// D
//   It is useful to split the string into an array for character iteration and filtering.
// A
//   Create a constant, `BAD_NUM` to be returned in case of invalid input.
//   Filter out any non-digit characters in the string using a regular expression.
//   If there are ten digits, return them.
//   If there are eleven digits...
//   -> if the first digit is one, return a slice of the string starting at the index of 1.
//      -> otherwise, return the bad number constant.
//   Otherwise
//   -> return the bad number constant.
// C

const BAD_NUM = '0000000000';

const filterCharacters = (str, func) => str.split('').filter(func).join('');
const onlyDigits = (c) => !!c.match(/\d/);

const cleanNumber = (numEntry) => {
  numEntry = filterCharacters(numEntry, onlyDigits);
  if (numEntry.length === 10) {
    return numEntry;
  } else if (numEntry.length === 11) {
    return numEntry[0] === '1' ? numEntry.slice(1) : BAD_NUM;
  } else {
    return BAD_NUM;
  }
}

console.log('Test Results');
console.log(cleanNumber('') === BAD_NUM) // empty string
console.log(cleanNumber('afweawfaa$#$@&@#') === BAD_NUM); // no digits at all
console.log(cleanNumber('(208) 999-8372') === '2089998372'); // invalid characters included
console.log(cleanNumber('7352133') === BAD_NUM); // less than ten digits
console.log(cleanNumber('2209817484') === '2209817484'); // ten digits
console.log(cleanNumber('12081234567') === '2081234567'); // eleven digits starting with 1
console.log(cleanNumber('52087654321') === BAD_NUM); // eleven digits starting with something else
console.log(cleanNumber('120872403333') === BAD_NUM); // more than 11 digits
