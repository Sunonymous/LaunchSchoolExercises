// Pattern Generation

// Given a positive number (nStars) between 1 and 9 (inclusive), return a square of text via the following format:
// (interestingly, the number of asterisks never actually reaches nStars)
// Example, with nStars of 7:
// 1******
// 12*****
// 123****
// 1234***
// 12345**
// 123456*
// 1234567

// we can use the index of a for loop to track the numbers we need to output.
// --> functionally, this seems to fit a reduce nicely, though we'll try procedural first.
// --> erm... the more its considered, the more it seems easier to be functional here.

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function multiplyChar(char, count) {
  if (count <= 0) {
    return '';
  } else if (char.length === count || char === '') {
    return char;
  } else {
    return multiplyChar(char + char[0], count);
  }
}

function generateRow(totalChars, rowIndex, specialChar = '*') {
  if (rowIndex > totalChars) return;
  let rng = range(rowIndex, 1).join('');
  let width = range(totalChars, 1).join('').length;
  return '' + rng + multiplyChar(specialChar, width - rng.length); // only the very last part of this function needed altering for the further exploration
}                                                                  // though it did take me a bit to puzzle it out

let generateRowInXMatrix = x => idx => generateRow(x, idx);

function generatePattern(nStars) {
  let rowInNMatrix = generateRowInXMatrix(nStars);
  return range(nStars, 1).map(rowInNMatrix).join('\n');
}

console.log(generatePattern(11));
