// How Old is Teddy?

// thanks, MDN!
function getRandomIntInclusive(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1) + min); //The maximum is inclusive and the minimum is inclusive
}

const teddyAge = getRandomIntInclusive(20, 200);
console.log(`Teddy is ${teddyAge} years old! That's different than yesterday...`);

// further exploration
// the documentation says that rounding the result makes the values follow a "non-uniform distribution"
