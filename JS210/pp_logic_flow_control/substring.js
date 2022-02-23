// this problem was already solved due to the requirement
// of this function to accomplish prior exercises (in a functional way)

// Substring
// literally copied and pasted my last function

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function substring(str, start, length = -1) {
  const maximumNegativeIndex = -1 * str.length;
  if (start < 0 && start >= maximumNegativeIndex) {
    start = str.length + start;
  } else if (str === '' || length <= 0) {
    return '';
  } else if (start + length > str.length || length === -1) {
    length = str.length - start;
  }
  const stringIndexes = range(length, start);
  const stringCharacters = stringIndexes.map(c => str[c]);
  return stringCharacters.join('');
}
// okay, so it took a little bit of finagling to get the desired behavior
// my original function would not accept negative start indexes
// there are still (i think) edge cases that would cause the function to fail.

let string = 'hello world';

console.log('Test Results:');
console.log(substring(string, 2, 4)=== 'llo ');      // "llo "
console.log(substring(string, -3, 2) === 'rl');      // "rl"
console.log(substring(string, 8, 20) === 'rld');     // "rld"
console.log(substring(string, 0, -20) === '');       // ""
console.log(substring(string, 0, 0) === '');         // ""
