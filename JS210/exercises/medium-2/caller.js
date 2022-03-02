// Caller

function doubler(number, caller) {
  console.log(`This function was called by ${caller}.`);
  return number * 2;
}

const doubledByX = x => n => doubler(n, x);
const doubledBySunny = doubledByX('Sunny');

doubledBySunny(11);
