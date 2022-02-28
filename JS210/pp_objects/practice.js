// Practice Problems - Object Properties

// 1

function objectHasProperty(obj, prop) {
  return obj[prop] !== undefined;
}

let pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

// ah, I guess the proposed solution makes more sense, as mine could return true if a property exists but with a value as undefined
// i'll rewrite it

function objectHasProperty(obj, prop) {
  keys = Object.keys(obj);
  return keys.includes(prop);
}

console.log('Prob1 Results');
console.log(!!objectHasProperty(pets, 'dog'));       // true
console.log(!objectHasProperty(pets, 'lizard'));    // false
console.log(!!objectHasProperty(pets, 'mice'));      // true

// 2

function incrementProperty(obj, prop) {
  obj[prop] = objectHasProperty(obj, prop) ? obj[prop] + 1 : 1;
}

let wins = {
  steve: 3,
  susie: 4,
};

console.log('Prob2 Results');
incrementProperty(wins, 'susie');   // 5
console.log(wins.susie === 5);                               // { steve: 3, susie: 5 }
incrementProperty(wins, 'lucy');    // 1
console.log(wins.lucy === 1);                               // { steve: 3, susie: 5, lucy: 1 }

// 3
function copyProperties(objFrom, objTo) {
  for (let key in objFrom) {
    objTo[key] = objFrom[key];
  }
  return Object.keys(objFrom).length;
}

let hal = {
  model: 9000,
  enabled: true,
};

let sal = {};
console.log('Prob3 Results');
console.log(copyProperties(hal, sal) === 2);  // 2
console.log(sal.model === 9000);                       // { model: 9000, enabled: true }
console.log(!!sal.enabled);                       // { model: 9000, enabled: true }

// 4
function wordCount(str) {
  let result = {};
  for (let word of str.split(' ')) {
    incrementProperty(result, word);
  }
  return result;
}

let test4 = wordCount('box car cat bag box');  // { box: 2, car: 1, cat: 1, bag: 1 }
console.log(test4)
console.log('Prob4 Results');
console.log(test4.box === 2);
console.log(test4.car === 1);
console.log(test4.cat === 1);
console.log(test4.bag === 1);
