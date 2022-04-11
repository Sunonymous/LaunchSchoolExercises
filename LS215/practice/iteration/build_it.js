"use strict";

// Iteration!

const myForEach = (array, func) => {
  for (let i = 0; i < array.length; i += 1) {
    func(array[i], i, array); // forgot that it passes all three of those things!
  }
}

// Test with LS Use-case
let min = Infinity;
let getMin = value => (min = value <= min ? value : min);
myForEach([4, 5, 12, 23, 3], getMin);
console.log(min === 3);                        // 3

// Filtering!

const myFilter = (array, func) => {
  let resultArray = [];
  myForEach(array, (em) => {
    if (func(em)) {
      resultArray.push(em);
    }
  })
  return resultArray;
}

let isPythagoreanTriple = function (triple) {
  return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2);
};

console.log(myFilter([{ a: 3, b: 4,  c: 5 },
                      { a: 5, b: 12, c: 13 },
                      { a: 1, b: 2,  c: 3 },], isPythagoreanTriple));

// returns [ { a: 3, b: 4, c: 5 }, { a: 5, b: 12, c: 13 } ]

// Mapping!

const myMap = (array, func) => {
  let resultArray = [];
  myForEach(array, (em) => {
    resultArray.push(func(em));
  })

  return resultArray;
}

let plusOne = n => n + 1;
console.log(myMap([1, 2, 3, 4], plusOne));       // [ 2, 3, 4, 5 ]

// Reducing!

// bit of logic first
// empty array?    return undefined
// single element? return element
// initial value provided?
//   accumulator = initial,  startIndex = 0
//   accumulator = array[0], startIndex = 1

const myReduce = (array, func, initialValue) => {
  if (array.length === 0) return undefined;
  if (array.length === 1) return array[0];

  let accumulator = null;
  let startIndex  = 0;

  if (initialValue === undefined) {
    accumulator = array[0];
    startIndex += 1;
  } else {
    accumulator = initialValue;
  };
  for (let i = startIndex; i < array.length; i += 1) {
    accumulator = func(accumulator, array[i], i, array);
  }
  return accumulator;
}

let smallest = (result, value) => (result <= value ? result : value);
let sum = (result, value) => result + value;

console.log(myReduce([5, 12, 15, 1, 6], smallest) === 1);
console.log(myReduce([5, 12, 15, 1, 6], sum, 10) === 49);

// wow, their solution is much more elegant!
// I will rewrite it from memory. (Some time has passed since reading it.)

const theirReduce = (array, func, initialValue) => {
  let accumulator = null
  let startIndex  = 0;

  if (initialValue === undefined) {
    accumulator = array[0];
    startIndex += 1;
  } else {
    accumulator = initialValue;
  }

  array.slice(startIndex).forEach((em) => {
    accumulator = func(accumulator, em);
  })

  return accumulator;
}

console.log(theirReduce([5, 12, 15, 1, 6], smallest) === 1);
console.log(theirReduce([5, 12, 15, 1, 6], sum, 10) === 49);

// while this version is more more concise and arguably elegant,
// it does obfuscate the ability to pass the current index of the iteration
// hmm.

// INTERROGATION

// since we're learning beyond procedural, let's work it into filter
const myOwnEvery = (array, func) => {
  return myFilter(array, func).length === array.length;
}

let isAString = value => typeof value === 'string';
console.log(!!myOwnEvery(['a', 'a234', '1abc'], isAString));       // true

// they say traversing the whole list is wasted effort in certain cases,
// which is true in this case. Doesn't scale well. Bueno...

const myOwnProceduralEvery = (array, func) => {
  for (let i = 0; i < array.length; i += 1) {
    if (!func(array[i])) {
      return false;
    }

    return true;
  }
}

console.log(!!myOwnProceduralEvery(['a', 'a234', '1abc'], isAString));       // true

// lol, sorting is too complex for us students here when mutation is required
// at least... that's what I figure. since it wasn't included as a "build it" practice
// "build it to pull your hair out!" (instead of to "understand it")
