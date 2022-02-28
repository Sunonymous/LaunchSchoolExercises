// Math Object Practice Problems

// 1
// radians -> degrees
// radians * 180 / pi

const radiansToDegrees = (rads) => (180 * rads) / Math.PI;
// example from website
console.log('Radian Test');
console.log(`${radiansToDegrees(1.571)} should be pretty close to 90`);

// 2
// not even really a function...
const negativeValue = -180;
console.log(`The absolute value of 'negativeValue' is ${Math.abs(negativeValue)}.`);

// 3
const prob3 = 16777216;
console.log(`The square root of ${prob3} is ${Math.sqrt(prob3)}.`);

// 4
console.log(`16 to the 6th power is ${Math.pow(16, 6)}.`);
// very clever...

// 5
let a = 50.72;
let b = 49.2;
let c = 49.86;
console.log(`I like fifties, such as ${Math.round(c)}, ${Math.ceil(b)}, and ${Math.floor(a)}.`);

// 6
// well, if you're giving it to me, then
function randInt(low, high) {
  if (high < low) {
    let oops = low;
    low = high;
    low = temp;
  } else if (high === low)
  return Math.floor(Math.random() * (high - low + 1) + low);
}
console.log(randInt(5, 5)); // i didn't do anything special for this but it works as "desired"

// 7
// oh, i guess there isn't a 7
