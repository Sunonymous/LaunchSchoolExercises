// Reverse It

const reverseSentence = str => str.split(' ').reverse().join(' ');

// bug doesn't call reverse, it just mentions the function

console.log('Test Results:');
console.log(reverseSentence('') === '');
console.log(reverseSentence('Hello World') === 'World Hello');
console.log(reverseSentence('Reverse these words') === "words these Reverse");

const fiveLettersPlus = word => word.length >= 5;
function reverseWords(str) {
  return str.split(' ').map(word => fiveLettersPlus(word) ? word.split('').reverse().join('') : word).join(' ');
}
// i know that's a super long line. i'm ready to go home

console.log(reverseWords('Professional') === "lanoisseforP");
console.log(reverseWords('Walk around the block') === "Walk dnuora the kcolb");
console.log(reverseWords('Launch School') === "hcnuaL loohcS");
