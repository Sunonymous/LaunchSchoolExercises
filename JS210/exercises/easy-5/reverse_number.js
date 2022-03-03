// Reverse Number

function reverseNumber(int) {
  return Number(String(int).split('').reverse().join(''));
}

console.log('Test Results:');
console.log(reverseNumber(12345) === 54321);
console.log(reverseNumber(12213) === 31221);
console.log(reverseNumber(456) === 654);
console.log(reverseNumber(12000) === 21);
console.log(reverseNumber(1) === 1);
