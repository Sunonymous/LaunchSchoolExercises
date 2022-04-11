"use strict";

// 1
const firstName = 'Sunny';
const lastName = 'Sunny';
const fullName = `${firstName} ${lastName}`;
console.log(fullName);
// 2
console.log(firstName.concat(lastName));
// 3
console.log(fullName.split(' '));
// 4
const language = 'JavaScript';
const idx = language.indexOf('S');
console.log(idx);
// 5
const charCode = language.charCodeAt(idx);
console.log(charCode);
// 6
console.log(String.fromCharCode(charCode));
// 7
console.log(language.lastIndexOf('a'));
// 8
const a = 'a';
let   b = 'b';
console.log(a > b);
b = 'B';
console.log(a > b);
// 9
const aIndex = language.indexOf('a');
const vIndex = language.indexOf('v');
console.log(language.substr(aIndex, 4));
console.log(language.substr(vIndex, 4));
// 10
console.log(language.substring(aIndex, 4));
console.log(language.substring(vIndex, 4));
// 11
const fact1 = 'JavaScript is fun';
const fact2 = 'Kids like it too';
const compoundSentence = fact1 + ' and ' + fact2.replace('K', 'k');
console.log(compoundSentence);
// 12
console.log(fact1[0], fact2[0]);
// 13
const pi = 22 / 7;
console.log(pi.toString().lastIndexOf('14'));
// 14
const boxNumber = (356).toString();
console.log(boxNumber);
// 15
console.log(typeof boxNumber);
console.log(typeof parseInt(boxNumber));
console.log(typeof String(parseInt(boxNumber)));
// 16
const userName = prompt('What is your name?');
const loudGreeting = (name) => `HEAVENS TO BETSY! I CANNOT TELL YOU HOW MUCH I SIMPLY ADORE THE NAME '${name.toUpperCase()}'. WHAT A DELIGHT TO MEET YOU!`;
const normalGreeting = (name) => `Hello, ${name}.`;
const endsInBang = (str) => str.endsWith('!');
const response = endsInBang(userName) ? loudGreeting(userName) : normalGreeting(userName);
console.log(response);
