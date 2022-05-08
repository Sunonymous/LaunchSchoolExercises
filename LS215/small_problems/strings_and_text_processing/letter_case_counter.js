'use strict';

// given a string, return an object with three properties containing the count of characters that are
//  - uppercase
//  - lowercase
//  - neither

const charCase = (c) => {
  if (c.match(/[a-z]/)) {
    return 'lowercase';
  } else if (c.match(/[A-Z]/)) {
    return 'uppercase';
  } else {
    return 'neither';
  }
};

const caseCountTemplate = {
  lowercase: 0,
  uppercase: 0,
  neither: 0,
}

const incrementCaseProperty = (obj, char) => {
  obj[charCase(char)] += 1;
}

const letterCaseCount = (string) => {
  const chars = string.split('');
  const result = {...caseCountTemplate};
  chars.forEach((c) => incrementCaseProperty(result, c));
  return result;
}

console.log('Test Results');
console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }
