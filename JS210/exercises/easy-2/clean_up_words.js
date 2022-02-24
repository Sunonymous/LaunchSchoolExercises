// Clean Up the Words

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function upperCaseAlphabet() {
  return range(26, 'A'.charCodeAt(0)).map(c => String.fromCharCode(c));
}

function lowerCaseAlphabet() {
  return range(26, 'a'.charCodeAt(0)).map(c => String.fromCharCode(c));
}

const ALPHABET = upperCaseAlphabet().concat(lowerCaseAlphabet());
// console.log(ALPHABET);

// first the easy bit, removing non-alphabetic characters

const isAlphabetic = c => ALPHABET.includes(c);
// console.log(isAlphabetic('l') === true);
// console.log(isAlphabetic('0') === false);

const replaceNonLettersWithSpaces = str => {
  return range(str.length, 0).map(idx => isAlphabetic(str[idx]) ? str[idx] : ' ').join('');
}

// now for the trickier bit, removing extra spaces
// my brain is tried, let's do procedural

function removeExtraSpaces(str) {
  for (let i = 0; i < str.length; i++) {
    if (str[i] === ' ' && str[i + 1] === ' ') {
      str = str.substring(0, i) + str.substring(i + 2);
    }
  }
  return str;
}
// console.log(removeExtraSpaces('  woah there     nelly   '));

const cleanUp = str => removeExtraSpaces(replaceNonLettersWithSpaces(str));

console.log('Test Result:');
console.log(cleanUp("---what's my +*& line?") === " what s my line ");
