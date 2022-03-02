// Searching 101

// wonder how many installations of readline-sync I have so far...
const rlSync = require('readline-sync');
// ooh, gotta borrow my word endings bit

const endsInX = x => n => String(n).endsWith(x);
const endsIn1 = endsInX('1');
const endsIn2 = endsInX('2');
const endsIn3 = endsInX('3');
const atLeastTwoDigits = n => String(n).length > 1;
const secondToLastDigitIs1 = n => {
  const cast = String(n);
  if (cast.length <= 1) return false;
  return cast[cast.length - 2] === '1';
}

const wordEndings = num => {
  if (endsIn1(num) && !secondToLastDigitIs1(num)) {
    return 'st';
  } else if (endsIn2(num) && !secondToLastDigitIs1(num)) {
    return 'nd';
  } else if (endsIn3(num) && !secondToLastDigitIs1(num)) {
    return 'rd';
  } else {
    return 'th';
  }
}

const solicitNumsIntoArray = (size) => {
  if (size < 1) return [];
  let result = [];
  do {
    let toGet  = result.length + 1;
    let toSay  = String(toGet) + wordEndings(toGet);
    let prompt = `Please enter the ${toSay} number: `;
    result.push(Number(rlSync.question(prompt)));
  } while (result.length < size);
  return result;
}

const isNumInArray = (array, num) => {
  let answer = array.includes(num) ? 'appears' : 'does not appear';
  console.log(`The number ${num} ${answer} in [${array.join(', ')}].`);
}

const buildNumberArrayAndCheckValue = (size) => {
  const numberArray = solicitNumsIntoArray(5);
  const checkVal    = Number(rlSync.question('Please enter the last number: '));
  isNumInArray(numberArray, checkVal);
}

buildNumberArrayAndCheckValue(5);

// I don't want to build another function for the further exploration without more specific requirements.
