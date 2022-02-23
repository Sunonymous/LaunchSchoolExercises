// this problem is interesting

// can't take credit for the unique one. Thanks, google => stackoverflow!
// at least i retyped it
const unique = (value, index, self) => {
  return self.indexOf(value) === index;
}
const getUnique = arr => arr.filter(unique);

const isXor = (x, y) => {
  return getUnique([!!x, !!y]).length === 2
}

console.log(isXor(false, true));     // true
console.log(isXor(true, false));     // true
console.log(isXor(false, false));    // false
console.log(isXor(true, true));      // false


console.log(isXor(false, 3));        // true
console.log(isXor('a', undefined));  // true
console.log(isXor(null, ''));        // false
console.log(isXor('2', 23));         // false
