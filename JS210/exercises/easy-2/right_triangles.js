// Right Triangles
// I don't remember all of them, but some of these exercises are familiar.

const TRIANGLE_CHAR = '*';

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

// Borrowed from a previous exercise
function repeat(string, times) {
  // edge cases
  if (times === 0) return '';
  if (times < 0)   return undefined;
  if (!Number.isInteger(times)) return undefined;

  let originalString = string;

  function recur(string, times) {
    if (string.length === originalString.length * times) {
      return string;
    } else {
      return recur(string + originalString, times);
    }
  }
  return recur(string, times);
}

const triangleRow = (length, index) => repeat(' ', length - index) + repeat(TRIANGLE_CHAR, index);

function triangle(length) {
  return range(length, 1).map(idx => triangleRow(length, idx)).join('\n');
}

console.log(triangle(5));
console.log(triangle(9));
