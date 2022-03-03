// Get the Middle Character

const centerOf = str => {
  const odd = str.length % 2 !== 0;
  const midpoint = Math.floor(str.length / 2)
  return odd ? str[midpoint] : str.slice(midpoint - 1, midpoint + 1);
}

console.log('Test Results:');
console.log(centerOf('I Love JavaScript') === 'a');
console.log(centerOf('Launch School') === ' ');
console.log(centerOf('Launch') === 'un');
console.log(centerOf('Launchschool') === 'hs');
console.log(centerOf('x') === 'x');
