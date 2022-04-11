"use strict";

const DEBUG = false;

// data
let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

// requirements
// all bands should have 'Canada' as their country
// band name should have every word capitalized
// band name should not have periods

// logic
// can generalize several functions here
// function "standardizePropertyVal" could set a given property to a given value in all objects passed
// function "capitalizeAllWords" will take a string, split it by spaces, capitalize every first letter, and re-join it with spaces
// function "removeCharFromString" will filter a particular character out from a string, similar to how the capitalization function works

const removeCharFromString = (string, char) => string.split('').filter((c) => c !== char).join('');

if (DEBUG) {
  console.log('Character Removal Tests');
  console.log(removeCharFromString('aabbbccc', 'b') === 'aaccc');
  console.log(removeCharFromString('', 'x') === '');
  console.log(removeCharFromString('lol', 'l') === 'o');
}

const capitalize = (string) => {
  if (string.length === 0) return '';
  const chars = string.split('');
  chars[0] = chars[0].toUpperCase();
  return chars.join('');
};

const capitalizeAllWords = (string) => string.split(' ').map(capitalize).join(' ');

if (DEBUG) {
  console.log('Capitalization Tests');
  console.log(capitalize('dog') === 'Dog');
  console.log(capitalize('') === '');
  console.log(capitalize('123hello') === '123hello'); // NOT making this function more useful
  console.log(capitalizeAllWords('ring around the rosie') === 'Ring Around The Rosie');
  console.log(capitalizeAllWords('') === '');
  console.log(capitalizeAllWords('123 is couNting') === '123 Is CouNting');
}

const standardizePropertyVal = (objects, property, value) => {
  objects.forEach((obj) => obj[property] = value);
}

if (DEBUG) {
  console.log('Property Standardization Tests');
  const obj1 = { working: false };
  const obj2 = { working: null };
  const obj3 = { related: false };
  standardizePropertyVal([obj1, obj2, obj3], 'working', true);
  console.log(obj1.working);
  console.log(obj2.working);
  console.log(obj3.working);
}

// now to string them all together!

const processBands = (bands) => {
  standardizePropertyVal(bands, 'country', 'Canada');
  bands = bands.map((band) => {
    band.name = capitalizeAllWords(band.name);
    band.name = removeCharFromString(band.name, '.');
    return band;
  })
  return bands;
}

console.log(processBands(bands));
