// Letter Swap

const swapFirstAndLast = str => {
  if (str.length < 2) return str;
  const firstChar = str[0];
  const lastChar  = str[str.length - 1];
  return lastChar + str.slice(1, -1) + firstChar;
}

const swap = str => {
  if (str.match(' ')) {
    return str.split(' ').map(swapFirstAndLast).join(' ');
  } else {
    return swapFirstAndLast(str);
  }
}

console.log('Test Results:');
console.log(swap('Oh what a wonderful day it is') === "hO thaw a londerfuw yad ti si");
console.log(swap('Abcde') === "ebcdA");
console.log(swap('a') === 'a');

// already used map!
