// Convert String to Number

function stringToInteger(strNum) {
  result   = 0;
  powerTen = 1;
  for (let i = strNum.length - 1; i > -1; i--) {
    result += strNum[i] * powerTen;
    powerTen *= 10;
  }
  return result;
}

// this only works because of implicit coercion, which is unsafe. cool, right? living dangerously.
console.log('Test Results:');
console.log(stringToInteger('4321') === 4321);      // 4321
console.log(stringToInteger('570') === 570);       // 570

// Convert to Signed Number

function stringToSignedInteger(strNum) {
  const positiveNumber = strNum[0] !== '-';
  const signs = ['+', '-'];
  strNum = signs.includes(strNum[0]) ? strNum.slice(1) : strNum;
  const result = stringToInteger(strNum);
  return positiveNumber ? result : (-1 * result);
}

console.log(stringToSignedInteger('4321') === 4321);      // 4321
console.log(stringToSignedInteger('-570') === -570);      // -570
console.log(stringToSignedInteger('+100') === 100);      // 100

// Convert Number to String
const VALUES = {
  0: '0',
  1: '1',
  2: '2',
  3: '3',
  4: '4',
  5: '5',
  6: '6',
  7: '7',
  8: '8',
  9: '9',
}

const numToStr      = n => VALUES[n];
const numDigits = n => {
  let digits = 0;
  if (n >= 1) digits += 1;
  while (n / 10 >= 1) {
    digits += 1;
    n /= 10;
  }
  return digits;
}

function integerToString(num) {
  const digits = [];
  const negative = num < 0;
  num = negative ? num * -1 : num;
  while (num > 0) {
    let powerOfTen = Math.pow(10, numDigits(num) - 1);
    let digit = Math.floor(num / powerOfTen);
    if (num % (digit * powerOfTen) === 0) {
      digits.push(digit);
      for (let n = 0; n < numDigits(num) - 1; n++) {
        digits.push(0);
      }
    } else {
      digits.push(digit);
    }
    num -= digit * powerOfTen;
  }
  if (negative) digits.unshift('-');
  return digits.length > 0 ? digits.map(numToStr).join('') : '0';
}

console.log(integerToString(4321) === '4321');      // "4321"
console.log(integerToString(0) === '0');         // "0"
console.log(integerToString(5000) === '5000');      // "5000"

function signedIntegerToString(num) {
  // taking notes from the simplicity of their last solution
  if (num === 0) {
    return '0';
  } else if (num > 0) {
    return '+' + integerToString(num);
  } else {
    return '-' + integerToString(num);
  }
}

console.log(signedIntegerToString(4321) === '+4321');
console.log(signedIntegerToString(-123) === '-123');
console.log(signedIntegerToString(0) === '0');

// ha! i'm stupid sleepy today :(
// instead of changing the original function, I could have altered it here... although now I extended the functionality of the other. \shrug/
