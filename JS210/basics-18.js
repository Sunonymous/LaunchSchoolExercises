// created this file because REPL isn't fun for multi-line bits

let apples = 3;
let bananas = '3';

// 5
if (apples === bananas) {
  console.log('Huh. Guess it really is true.');
} else if (apples == bananas) {
  console.log('They are of the same value, but not the same type.');
} else {
  console.log('Not a chance.');
}

// 6
if (apples === bananas) {
  console.log('Huh. Guess it really is true.');
} else {
  if (apples == bananas) {
    console.log('They are of the same value, but not the same type.');
  } else {
  console.log('Not strictly equal.');
  }
}

//7
apples = 3;
bananas = 3;
let areEqual = apples === bananas;
console.log(areEqual);

// 8
apples = 3;
bananas = undefined;
let eitherOr = apples || bananas;
console.log(eitherOr);

// 9
bananas = 1;
eitherOr = apples || bananas;
console.log(eitherOr);
eitherOr = bananas || apples;
console.log(eitherOr);

// 10
let lastName = 'Sunny';
let familyMessage = lastName === 'Sunny' ? 'You are part of the family!' : 'You are not family.';
console.log(familyMessage);
