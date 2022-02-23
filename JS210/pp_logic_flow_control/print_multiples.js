// Print Multiples
// do these files really need headers??

// The odd number requirement is invisible via the function name. That's mysterious.
// Given a positive integer, return ("log") all of its multiples between 1 and 100 which are odd numbers.
// We could iterate, though that's costly, moreso than other solutions.
// In constructing the loop, for example, instead of decrementing by one, we could decrement by n.
// The challenge then is determining the start point of the loop, which could be done by skipping iterations until reaching a multiple of n.

const isMultipleOf = (x, y) => x % y === 0;
const isOdd = n => n % 2 !== 0;

const highestMultipleLessThan100 = x => {
  for (let i = 100; i >= 0; i--) {
    if (isMultipleOf(i, x)) return i;
  }
}
// not writing tests for these, though they were tested manually via the REPL
// let's try that first one recursively instead
const recHighestMultipleUnder = (x, upperLimit = 100) => {
  if (upperLimit % x === 0 || upperLimit === 0) {
    return upperLimit;
  } else {
    return recHighestMultipleUnder(x, upperLimit - 1);
  }
}
// could shorten to ternary? or is that too unreadable?
const recTernHighMultUnder = (x, top = 100) => isMultipleOf(top, x) || x === 0 ? top : recTernHighMultUnder(x, top - 1);

function logMultiples(n) {
  for (let i = recTernHighMultUnder(n); i >= 0; i -= n) {
    if (isOdd(i)) console.log(i);
  }
}

logMultiples(17);
console.log('---');
logMultiples(21);

// i did the further exploration without reading it. cool.
// although recursion seems a bit overkill compared to that simple math function
