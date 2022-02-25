// Rot 13 Cipher

// Given a string, rotate each alphabetic character thirteen positions forward in the (wrapped) alphabet.

const CHARS_IN_ALPHABET = 26;
const FIRST_UPPERCASE_CHAR = 'A';
const FIRST_LOWERCASE_CHAR = 'a';

const START_INDEXES = {
  upper: FIRST_UPPERCASE_CHAR.charCodeAt(0),
  lower: FIRST_LOWERCASE_CHAR.charCodeAt(0),
}

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function upperCaseAlphabet() {
  return range(CHARS_IN_ALPHABET, START_INDEXES['upper']).map(c => String.fromCharCode(c));
}

function lowerCaseAlphabet() {
  return range(CHARS_IN_ALPHABET, START_INDEXES['lower']).map(c => String.fromCharCode(c));
}

function charCase(char) {
  if (upperCaseAlphabet().includes(char)) {
    return 'upper';
  } else if (lowerCaseAlphabet().includes(char)) {
    return 'lower';
  } else {
    return 'non-letter';
  }
}

function shiftForward(char, amount) {
  if (charCase(char) === 'non-letter') {
    return char;
  } else {
    const startCharIdx = START_INDEXES[charCase(char)];
    const charCodes    = range(CHARS_IN_ALPHABET, startCharIdx);
    const currentIdx   = charCodes.indexOf(char.charCodeAt(0));
    const adjustedIdx  = (((currentIdx + amount) % charCodes.length) + charCodes.length) % charCodes.length;
    return String.fromCharCode(charCodes[adjustedIdx]);
  }
}

const shiftXForward  = x => c => shiftForward(c, x);

const createShiftCipher = (shiftCount) => {
  let result = {};
  result['encode'] = shiftXForward(shiftCount);
  result['decode'] = shiftXForward(CHARS_IN_ALPHABET - shiftCount);
  return result;
}

const mapOverChars = (str, f) => str.split('').map(f).join('');

const shiftCipher  = (str, count, action = 'encode') => {
  if (action !== 'encode') action = 'decode'; // way oversimplified, but for the purposes of this example I don't care
  if (count === 0)         return str;
  return mapOverChars(str, createShiftCipher(count)[action]);
}

const rot13 = (str, action = 'encode') => shiftCipher(str, 13, action);

const string = 'Teachers open the door, but you must enter by yourself.';
const result = 'Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.';

console.log('Test Results:');
console.log(rot13(string)        === result);
console.log(rot13(rot13(string)) === string);
console.log(rot13(result, 'decode') === string); // to show off the new decoding functionality!
