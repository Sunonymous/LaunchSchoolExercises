// Rot 13 Cipher

// Given a string, rotate it thirteen characters forward in the alphabet.

const START_INDEXES = {
  upper: 'A'.charCodeAt(0),
  lower: 'a'.charCodeAt(0),
}

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function upperCaseAlphabet() {
  return range(26, START_INDEXES['upper']).map(c => String.fromCharCode(c));
}

function lowerCaseAlphabet() {
  return range(26, START_INDEXES['lower']).map(c => String.fromCharCode(c));
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
    const charCodes    = range(26, startCharIdx);
    const currentIdx   = charCodes.indexOf(char.charCodeAt(0));
    const adjustedIdx  = (currentIdx + amount) % charCodes.length;
    return String.fromCharCode(charCodes[adjustedIdx]);
  }
}

const shift13Forward = c => shiftForward(c, 13);

function rot13(str) {
  return str.split('').map(shift13Forward).join('');
}

const string = 'Teachers open the door, but you must enter by yourself.';
const result = 'Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.';

console.log('Test Results:');
console.log(rot13(string)        === result);
console.log(rot13(rot13(string)) === string);
