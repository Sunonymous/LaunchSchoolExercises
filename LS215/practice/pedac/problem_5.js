'use strict';

// RAILS CIPHER

// P
// Implement an encryption and decryption method for the rails algorithm.
// Given a message and a number of rails (could default to 3), encrypt the message by writing it
//   in a zig-zag pattern alternating up and down between these rails.
// After the message has been arranged as described, compile and return the string sequentially.
//
// Rules
//   Empty strings should function as expected, returning another empty string.
//   Spaces are stripped from the message.
//
// Notes
//   Spaces are ignored in the context of this cipher. A bit more effort for the reader, then,
//     and potentially some cases of ambiguity at times.
//   The provided message uses three "rails", though that isn't necessarily a hard requirement.
//   For example, the given message translates evenly in three rails, though that largely depends
//     on the length of the message. Do we determine the number of rails via the message length?
//     Or should it always be a fixed or given number of rails?
//   As the number of rails approaches or exceeds the number of characters in the message, the
//     message loses its obfuscation.
//   I opened up the Ruby exercise and discovered that an arbitrary number of rails may be used,
//     with the consequences as noted. It could be more accurately said that a rail-count of one
//     is completely useless in terms of the cipher, and two rails only alternates characters.
//   This was also a good recognition that the cipher preserves case, for which no information
//     is contained within the problem description itself.
//   I wondered if the number of rails had to equal out to the number of characters, which it
//     does not. They should really move the Ruby examples into the JS problem example.
//   What could be done about improper amounts of rails? Set them to a default value. 3?
// D
//   We are going to use a map to hold the content of the lines/rails, because this affords us
//     access by key, which we will use to build a "key" for the cipher. I'm using the word key
//     in two senses here.
//   An array may hold the cipher's key, because that is easy to build and may be accessed via
//     index, the same as the characters in the string message itself.
// A
//   In both cases for this particular challenge, we will construct a cipher map to hold the lines/rails.
//   If the rail count is zero, negative, or invalid, set it to the default of three.
//   ENCRYPT -
//     Generate a key for the message via BUILD_KEY.
//     Strip the message of whitespace.
//     Create an key object to hold the lines of the rails. Initialize keys for the number of rails with
//       empty strings as values.
//     Split the stripped message into an array of its characters.
//     Iterate over the characters array and add them to the line in the key object using the index of
//       the letter as corresponding to the key array.
//     Join the
//   BUILD_KEY_SEQ
//     Start with an empty array, and create a range from 1 to the number of rails, inclusively.
//     Map over the elements in this array to cast them all to String.
//     Add to this array a reversed slice of all but the first and last element.
//       Because 1 and 2 rails are special cases, these will be included manually.
//       One rail is a repeating sequence of 1s. Two rails repeats 1, 2, 1, 2... etc.
//   BUILD_KEY
//     Given the number of rails, create an array of a repeated pattern of indices from 1, up to the
//       number of rails, and back down to 2, cycling/repeating onwards from there that same sequence.
//     This is done recursively by starting with an empty key array and adding that sequence until the
//       length of the array matches or exceeds the length of the stripped message.
//   ASSEMBLE
//     Concatenate the values at each of the rail keys in numerical order.
//   DECRYPT - ALGORITHM
//     Generate a key via the same manner as the encryption algorithm.
//     Count the number of characters which are allotted into each rail.
//     Take the count of characters in each row and remove them successively from the
//       encrypted string and put them into the appropriate rows.
//     Reconstruct the string by removing them from the key in order of the key sequence.
// C
const range              = (len, from) => [...Array(len).keys()].map(n => n + from);
const filterCharacters   = (str, func) => str.split('').filter(func).join('');
const notWhitespace      = (c)         => !c.match(/\s/);
const stripWhitespace    = (str)       => filterCharacters(str, notWhitespace);
const countOf            = (arr, em)   => arr.filter((x) => x === em).length;
const stringToChars      = (str)       => str.split('');
const mapOverValues      = (obj, func) => Object.keys(obj).forEach((k) => obj[k] = func(obj[k]));

const cipherSeed         = (numRails)  => {
  const rails = range(numRails, 1).map(String);
  const descending = rails.slice(1, rails.length - 1).reverse();
  return rails.concat(descending);
}

const buildSequence = (seed, len) => {
  if (seed.length >= len) {
    return seed.slice(0, len);
  } else {
    return buildSequence([...seed, ...seed], len);
  }
}

// Final Functions

function encrypt(message, numberOfRails) {
  if (message === '' || numberOfRails < 1) return '';                         // edge of improper input
  if (numberOfRails === 1 || numberOfRails >= message.length) return message; // edge of useless cipher

  message        = stripWhitespace(message);
  const sequence = buildSequence(cipherSeed(numberOfRails), message.length);
  const rails    = range(numberOfRails, 1).map(String);
  const key      = Object.fromEntries(rails.map((r) => [r, '']));
  message.split('').forEach((c, idx) => key[sequence[idx]] += c);

  return Object.values(key).join('');
}

function decrypt(message, numberOfRails) {
  if (message === '' || numberOfRails < 1) return ''; // edge of improper input
  if (numberOfRails === 1 || numberOfRails >= message.length) return message; // edge of useless cipher

  const sequence = buildSequence(cipherSeed(numberOfRails), message.length);
  const rails    = range(numberOfRails, 1).map(String);
  const key      = {};

  rails.forEach((r) => {
    const count = countOf(sequence, r);
    key[r]      = message.slice(0, count);
    message     = message.slice(count);
  })

  mapOverValues(key, stringToChars);

  let result = '';
  while (sequence.length > 0) {
    const nextRail = sequence.shift();
    result += key[nextRail].shift();
  }

  return result;
}

console.log('Encryption Test Results:');
console.log(encrypt('', 4) === '');
console.log(encrypt('WE ARE DISCOVERED FLEE AT ONCE', 3) === 'WECRLTEERDSOEEFEAOCAIVDEN');
console.log(encrypt('One rail, only one rail', 1) === 'One rail, only one rail');
console.log(encrypt('XOXOXOXOXOXOXOXOXO', 2) === 'XXXXXXXXXOOOOOOOOO');
console.log(encrypt('EXERCISES', 4) === 'ESXIEECSR');
console.log(encrypt('More rails than letters', 24) === 'More rails than letters');

console.log('Decryption Test Results:');
console.log(decrypt('', 4) === '');
console.log(decrypt('WECRLTEERDSOEEFEAOCAIVDEN', 3) === 'WEAREDISCOVEREDFLEEATONCE');
console.log(decrypt('ABCDEFGHIJKLMNOP', 1) === 'ABCDEFGHIJKLMNOP');
console.log(decrypt('XXXXXXXXXOOOOOOOOO', 2) === 'XOXOXOXOXOXOXOXOXO');
console.log(decrypt('TEITELHDVLSNHDTISEIIEA', 3) === 'THEDEVILISINTHEDETAILS');
