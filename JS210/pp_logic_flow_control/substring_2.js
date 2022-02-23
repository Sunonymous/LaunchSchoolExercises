// Substring 2
// Ironically, this is how I originally wrote the substring function,
// before realizing that this way is clumsier and not so intuitive.

// I erased the original function in the process though, so we'll need to redo it.

// CONSTRAINTS

// Let's consider the edges
// those last two constraints need to be handled first, and after undefined
    // if start or end are negative or NaN, consider them 0
    // if start or end are greater than string length, clamp it to string length
    // if end is undefined/absent, return the substring starting at `start` until the end of the string
// then the swapping
    // if start is greater than end, swap the values and return the requested substring
// then lazy case
    // if start === end, return ''
// finally the work
    // if start is positive and end is positive and both are valid indexes, return the requested substring

function substring(str, startIdx, endIdx) {
  if (Number(startIdx) < 0 || isNaN(Number(startIdx))) startIdx = 0;
  if (endIdx === undefined) endIdx = str.length;
  if (Number(endIdx)   < 0 || isNaN(Number(endIdx))) endIdx   = 0;
  if (startIdx > str.length) startIdx = str.length;
  if (endIdx   > str.length) endIdx   = str.length;
  if (startIdx === endIdx) return '';
  if (startIdx > endIdx) {
    let temp = startIdx;
    startIdx = endIdx;
    endIdx   = temp;
  }
  return range(endIdx - startIdx, startIdx).map(idx => str[idx]).join('');
}

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

let string = 'hello world';

console.log('Test results:');
console.log(substring(string, 2, 4) === 'll');
console.log(substring(string, 4, 2) === 'll');
console.log(substring(string, 0, -1) === '');
console.log(substring(string, 2) === 'llo world');
console.log(substring(string, 'a') === 'hello world');
console.log(substring(string, 8, 20) === 'rld');

// this was a lot more work than I expected
// the flow control of this function is very messy
