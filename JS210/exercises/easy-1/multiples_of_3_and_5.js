// Multiples of Three and Five

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

const sum = (n, memo) => n + memo;
const divisibleByThree = n => n % 3 === 0;
const divisibleByFive  = n => n % 5 === 0;
const divisbleByThreeOrFive = n => divisibleByThree(n) || divisibleByFive(n);

const multisum = upto => range(upto, 1).filter(divisbleByThreeOrFive).reduce(sum)

console.log(multisum(3) === 3);
console.log(multisum(5) === 8);
console.log(multisum(10) === 33);
console.log(multisum(1000) === 234168);
