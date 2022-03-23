// Array Practice Exercises

// 1
const lastInArray = arr => arr[arr.length - 1];

// 2
const rollCall = namesArray => {
  for (let idx = 0; idx < namesArray.length; idx++) {
    console.log(namesArray[idx] + '?');
  }
}
// console.log(rollCall(['Dude', 'Sampson', 'Carlton', 'Fisher', 'Dawg']));

// 3
const reverser = arr => {
  let result = [];
  for (let idx = arr.length - 1; idx > -1; idx--) {
    result.push(arr[idx]);
  }
  return result;
}
// console.log(reverser(['perspective.', 'right', 'the', 'from', 'only', 'sense', 'make', 'things', 'Many']));

// 4
const simpleJoiner = arr => {
  let result = '';
  for (let idx = 0; idx < arr.length; idx++) {
    result += String(arr[idx]);
  }
  return result;
}
console.log(simpleJoiner(['i', 'M', 'a', 'g', 1, 'N', 4, 't', 'I', 0, 'n']));
