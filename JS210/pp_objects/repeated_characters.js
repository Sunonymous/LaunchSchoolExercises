// Repeated Characters

// oh, look! reusable functions from before!
function objectHasProperty(obj, prop) {
  keys = Object.keys(obj);
  return keys.includes(prop);
}

function incrementProperty(obj, prop) {
  obj[prop] = objectHasProperty(obj, prop) ? obj[prop] + 1 : 1;
}

function wordCount(str) {
}

function repeatedCharacters(word) {
  let result = {};
  for (let char of word.toLowerCase().split('')) {
    incrementProperty(result, char);
  }
  for (let char of Object.keys(result)) { // yay accidentally forgetting about normal key iteration!
    if (result[char] < 2) delete result[char];
  }
  return result;
}

console.log('Test Results:');
console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }
