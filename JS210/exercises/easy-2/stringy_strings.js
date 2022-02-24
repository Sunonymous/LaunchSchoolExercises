// Stringy Strings

// this seems like a job for recursion man!
// what kind of superhero would that even be??

function stringy(n, result = '1') {
  if (n <= 0) return null;
  if (result.length === n) return result;
  const nextNum = result[result.length - 1] === '1' ? '0' : '1';
  return stringy(n, result + nextNum);
}

console.log('Test Results:');
console.log(stringy(6) === "101010");
console.log(stringy(9) === "101010101");
console.log(stringy(4) === "1010");
console.log(stringy(7) === "1010101");
