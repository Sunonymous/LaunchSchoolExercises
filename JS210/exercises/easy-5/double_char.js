// Double Char P1

function repeater(str) {
  return str.split('').map(c => [c, c]).flat().join('');
}

console.log('Test Results:');
console.log(repeater('Hello') === "HHeelllloo");
console.log(repeater('Good job!') === "GGoooodd  jjoobb!!");
console.log(repeater('') === '');

// Part 2

const isConsonant = c => {
  if (!c.match(/[A-Za-z]/)) return false;
  if (c.match(/[AEIOUaeiou]/) ) return false;
  return true;
}

function doubleConsonants(str) {
  return str.split('').map(c => isConsonant(c) ? [c, c] : c).flat().join('');
}

console.log(doubleConsonants('String') === "SSttrrinngg");
console.log(doubleConsonants('Hello-World!') === "HHellllo-WWorrlldd!");
console.log(doubleConsonants('July 4th') === "JJullyy 4tthh");
console.log(doubleConsonants('') === '');
