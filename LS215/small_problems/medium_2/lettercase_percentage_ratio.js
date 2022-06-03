'use strict';

// the location may have to be altered within each distinct folder
const TESTER = require('../../testerV2');
const t = TESTER.makeTestSuite();

/*
Problem-->
Given a non-empty string, return an object containing three keys, 'lowercase', 'uppercase', and 'neither'.
Each of the values of those keys contains a floating point number which describes the percentage of
characters in the given string which match the case specified.
-- IO
---- Input  -> A non-empty string.
---- Output -> Object containing character case ratio.
---- Edges  -> Told to ignore empty string input. Non-string inputs are unspecified;
                 could be cast to string or return undefined.
-- Rules
Uppercase characters consist of uppercase letters.
Lowercase characters consist of lowercase letters.
All other characters fall into the 'neither' category.
Percentages are rounded to two decimal places.
-- Notes
Woah! Didn't catch this at first: the percentages are strings in the values of the result!
Uh... I guess this is the default return type for toFixed. Go figure.
Number.toFixed(2) returns a rounded floating-point number.
Non-string input will vary depending on how Node casts to string.
  Maybe it's safer just to return undefined. Certainly faster.
Examples-->
---- Tests for Invalid Input
t.addTest(letterPercentages, '', '');
t.addTest(letterPercentages, undefined, 42);
t.addTest(letterPercentages, undefined, []);
t.addTest(letterPercentages, undefined, {});
---- Tests for Normal Operation
t.addTest(letterPercentages, {lowercase: 0, uppercase: 0, neither: 0}, '');
t.addTest(letterPercentages, {lowercase: 50.00, uppercase: 10.00, neither: 40.00}, 'abCdef 123');
t.addTest(letterPercentages, {lowercase: 37.50, uppercase: 37.50, neither: 25.00}, 'AbCd +Ef');
t.addTest(letterPercentages, {lowercase: 0.00, uppercase: 0.00, neither: 100.00}, '123');
t.addTest(letterPercentages, {lowercase: 100.00, uppercase: 0.00, neither: 0.00}, 'hellothere');
t.addTest(letterPercentages, {lowercase: 0.00, uppercase: 100.00, neither: 0.00}, 'HELLOTHERE');

Data Structure-->
We will be returning an object at the end of the function.

Algorithm-->
Create the case ratio object to mutate and return.
Create a variable, `totalChars` to track the character count.
Split the given string into characters and iterate over it.
On each character, increment `totalChars` and the property of the case of the character in the ratio obj.
Return mapping over the values in the character case obj calculating their percentage, then cast to String.

Functions-->
[✓] incrementProperty(obj, prop)
----- Increments the value at the property `prop`, or, if it does not exist, sets it to 1.
[✓] charCase(c)
----- Returns the case of the character, either 'uppercase', 'lowercase', or 'neither'.
[✓] percentage(part, total)
----- Returns a floating point number as a result of dividing the total by the part.
*/

const DEBUG = false;

// Helpers
const lowerAlpha = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
const upperAlpha = lowerAlpha.map((c) => c.toUpperCase());
const caseObjTemplate = {lowercase: 0, uppercase: 0, neither: 0};

const range           = (len, from) => [...Array(len).keys()].map((n) => n + from);
const charCase        =         (c) => {
  if (lowerAlpha.includes(c)) {
    return 'lowercase';
  } else if (upperAlpha.includes(c)) {
    return 'uppercase';
  } else {
    return 'neither';
  }
}

const incrementProperty = (obj, prop) => {
  obj = {...obj};
  if (obj[prop] && typeof obj[prop] === 'number') {
    obj[prop] += 1;
  } else {
    obj[prop] = 1;
  }
  return obj;
}

const percentage = (part, total) => (part / total * 100).toFixed(2);

// Edges
const edgeCheck = (chars) => {
  if (typeof chars !== 'string' || chars === '') return undefined;
  return null;
}

// Primary
function letterPercentages(chars) {
  const isEdge = edgeCheck(chars);
  if (isEdge !== null) return isEdge;
  
  let result = {...caseObjTemplate};
  let totalChars = 0;
  chars.split('').forEach((c) => {
    totalChars += 1;
    result = incrementProperty(result, charCase(c));
  });

  Object.keys(result).forEach((cse) => result[cse] = percentage(result[cse], totalChars));

  return result;
}

if (DEBUG) {
  let testObj = {life: 42};
  t.addTest(incrementProperty, {a: 1, life: 42}, testObj, 'a');              // non-present property
  t.addTest(incrementProperty, {life: 43}, {life: 42}, 'life');              // present property
  testObj.a = ['bug'];
  t.addTest(incrementProperty, {a: 1, life: 42}, testObj, 'a');              // will overwrite
  t.addTest(percentage, '0.00',    0, 20);
  t.addTest(percentage, '100.00', 25, 25);
  t.addTest(percentage, '50.00',  25, 50);
} else {
  t.addTest(letterPercentages, undefined, '');
  t.addTest(letterPercentages, undefined, 42);
  t.addTest(letterPercentages, undefined, []);
  t.addTest(letterPercentages, undefined, {});
  t.addTest(letterPercentages, {lowercase: '50.00', uppercase: '10.00', neither: '40.00'}, 'abCdef 123');
  t.addTest(letterPercentages, {lowercase: '37.50', uppercase: '37.50', neither: '25.00'}, 'AbCd +Ef');
  t.addTest(letterPercentages, {lowercase: '0.00', uppercase: '0.00', neither: '100.00'}, '123');
  t.addTest(letterPercentages, {lowercase: '100.00', uppercase: '0.00', neither: '0.00'}, 'hellothere');
  t.addTest(letterPercentages, {lowercase: '0.00', uppercase: '100.00', neither: '0.00'}, 'HELLOTHERE');
}

// Tests
t.runSuite();
