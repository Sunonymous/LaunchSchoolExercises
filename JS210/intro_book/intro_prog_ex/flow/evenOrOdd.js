let evenOrOdd = function(num) {
  if (!(Number.isInteger(num))) {
    console.log(`${num} is not an integer. Aborting operation.`)
    return;
  }
  if (num % 2 === 0)
    console.log(`${num} is even.`);
  else
    console.log(`${num} is odd.`);
}

evenOrOdd(2);
evenOrOdd(5);
evenOrOdd(8);
evenOrOdd('72');

let iYellPhrases = function(str) {
  return str.length > 10 ? str.toUpperCase(str) : str
}

console.log(iYellPhrases('hello'));
console.log(iYellPhrases('hello there my dear good fellow'));

let numberRange = function(num) {
  if (!(Number.isInteger(num))) {
    console.log(`Improper value given: ${num}. Aborting.`);
    return;
  }
  if (num >= 0 && num <= 50)
    console.log(`${num} is between 0 and 50`);
  else if (num >= 51 && num <= 100)
    console.log(`${num} is between 51 and 100`);
  else if (num > 100)
    console.log(`${num} is greater than 100`);
  else
    console.log(`${num} is less than 0`);
}
numberRange(25);
numberRange(75);
numberRange(125);
numberRange(-25);
