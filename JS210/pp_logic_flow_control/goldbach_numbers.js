// borrowed! thanks, me!

const oneOrLess                = x      => x <= 1;
const evenlyDivides            = (x, y) => x % y === 0;
const halfANumber              = x      => parseInt(x / 2);
const greaterThanOrEqualToHalf = x      => x >= halfANumber(x);
const isEven                   = x      => evenlyDivides(x, 2);

// sort of surprising that JS doesn't have any sort of built-in range
function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function isPrime(n) {
  if (n === 0 || n === 1) return false;
  for (let i = 2; i < n; i++) {
    if (n % i === 0) return false;
  }
  return true;
}

const sumsTo = (a, b, s) => a + b === s;
const sumsToX = (x) => (a, b) => sumsTo(a, b, x);

function checkGoldbach(n) {
  if (n < 4 || n % 2 !== 0) {
    console.log(null);
    return;
  } else {
    const primes  = range(n, 1).filter(isPrime);
    const sumsToN = sumsToX(n);
    for (let i = 0; i < primes.length; i++) {
      for (let j = 0; j < primes.length; j++) {
        let num1 = primes[i];
        let num2 = primes[j];
        if (sumsToN(num1, num2)) console.log(num1 + ' ' + num2);
      }
    }
  }
}
// that almost works, though via the hint, we need to rework our thinking
// let's stop checking for the sum and start just checking each combination for primeness
function checkGoldbach(n) {
  if (n < 4 || n % 2 !== 0) {
    console.log(null);
    return;
  } else {
    for (let i = 2; i < n; i++) {
      let num1 = i;
      let num2 = n - num1;
      if (num1 > num2) break;
      if (isPrime(num1) && isPrime(num2)) console.log(num1 + ' ' + num2);
    }
  }
}
// this works, though it could be refactored

function arrayOfPairSums(n) {
  let rangeInts = range(parseInt(n / 2), 1);
  return rangeInts.map(e => [e, n - e]);
}

function allPrime(arr) {
  return arr.every(isPrime);
}

function checkGoldbach(n) {
  if (n < 4 || n % 2 !== 0) {
    console.log(null);
    return;
  } else {
    let pairs = arrayOfPairSums(n).filter(allPrime);
    pairs.forEach(em => console.log(em.join(' '))); // super
  }
}

console.log(checkGoldbach(3));
console.log('---');
console.log(checkGoldbach(4));
console.log('---');
console.log(checkGoldbach(12));
console.log('---');
console.log(checkGoldbach(100));
