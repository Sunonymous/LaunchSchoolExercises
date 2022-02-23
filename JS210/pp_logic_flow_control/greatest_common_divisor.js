// borrowing from another exercise here

const evenlyDivides            = (x, y) => x % y === 0;
const halfANumber              = x      => parseInt(x / 2);
const greaterThanOrEqualToHalf = x      => x >= halfANumber(x);

// first we need to get the factors
function getFactors(n) {
  let result = [];
  for (let i = 0; i <= n; i++) {
    if (evenlyDivides(n, i)) result.push(i);
  }
  return result;
}

// that's cool and all... but!
// we could even make this more declarative, using a range
function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}
// ooh! practice with currying too, maybe?
const isAFactorOf = (x) => (y) => evenlyDivides(x, y);

function getFactors(n) {
  partial = isAFactorOf(n);
  return range(n, 1).filter(partial);
}

function itemsInBoth(arrA, arrB) {
  let alsoInB = e => arrB.includes(e);
  return arrA.filter(alsoInB);
}

function gcd(x, y) {
  let commonFactors = itemsInBoth(getFactors(x), getFactors(y));
  return Math.max(...commonFactors);
}

console.log(gcd(12, 4));   // 4
console.log(gcd(15, 10));  // 5
console.log(gcd(9, 2));    // 1
console.log(`Reduce? ${[12, 4, 8].reduce(gcd)}`);
// coool. works with reduce too, automagically!
// i may not have a cool algorithm, but it's nice to see some functional tendencies appearing
