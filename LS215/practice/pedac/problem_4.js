'use strict';

/*
You are given a list of numbers in a "short-hand" range where only the significant
part of the next number is written because we know the numbers are always increasing
(ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]). Some people use different
separators for their ranges (ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the
same numbers [1, 2, 3, 11, 12]). Range limits are always inclusive.

Your job is to return a list of complete numbers.

The possible separators are: ["-", ":", ".."]
*/

// MY TURN

/* P
Given a short-hand notation of a range, return an array of the expanded or full version
of all the numbers included in the range.
Input  -> String of short-hand ranges.
Output -> Array of expanded ranges.
  It is not clear that an array is requested. Since JS does not have a "list", we're going with an array.
  That's more functional than console output, anyway.

Rules:
The numbers are always increasing, ie. ranges are cumulative.
Ranges are inclusive.

Notes:
Spaces are irrelevant and may be deleted and split over commas alone. This is less prone to error.
  Whitespace will interfere with certain parts of my algorithm.
The problem terminology uses the word ranges in multiple senses. It makes more sense to me to use
`range` when a particular series of numbers are present, and `keyframe` when a single number is present.
We will need a variable to track the last number present, so that we know when to add the base.
All ranges appear to increment by one. Thank god. (Note that this does NOT mean that all keyframes differ by 1!)
No instructions are provided as to improper input, so we shall walk the happy path and the happy path alone!
  Via working through this problem, there are /many/ ways that this could go wrong with improper input!

We will need a functions to:
- remove spaces
- split by separators
- expand range
- add base until exceeds number
*/

// D
// We will be using arrays to process this mamma-jamma. They afford us a lot of iterative capacity.

// A
// Create a variable, lastEncountered, to hold the last number processed.
// Remove spaces and split the string by commas to get an array of ranges and/or keyframes.
// For each element in that array, we'll use a specific function to process it.
// PROCESS_ELEMENT(element)
//   If the element does not contain separators, it is a keyframe.
//     ADD_BASE and return it cast to Number and set the lastEncountered to its value.
//   If the range contains separators, map over it split it on those separators with the
//     ADD_BASE and then the FILL_RANGE function
//   Iterate through the range's keyframes with ADD_BASE.
// ADD_BASE(strNum, lastEncountered)
//   Create a variable called value for the strNum cast to Number.
//   If value is lower than the last encountered number
//     Add the base to the power of the length of strNum (ie. number of digits)
//       to value until it is higher than lastEncountered and then return that after
//       setting lastEncountered to value.
//   Otherwise, return the number itself and set lastEncountered to its value.
// FILL_RANGE(range)
//   This function is given an array range which had been split via the separators.
//   It will return a new range created via the range function being passed the last value
//     of the range minus the first value, and the first value for the second argument.
//
// High-Level Overview
// shorthand -> flatMap of PROCESS_ELEMENT
//                         -> ADD_BASE
//                         -> FILL_RANGE(em split on separators and mapped with ADD_BASE)

// C

const BASE = 10; // yay decimal!

// used some nifty non-capturing syntax that the internet taught me.
// this prevents the separators themselves from being included in the results
//   with the added benefit of EXTRA illegibility! far out!
const SEPARATORS = /(?:\-|\:|\.\.)/;
const containsSeparators = (str) => !!str.match(SEPARATORS);
const range = (len, from) => [...Array(len).keys()].map(n => n + from);
const filterCharacters  = (str, func) => str.split('').filter(func).join('');
const notWhitespace = (c) => !c.match(/\s/);
const stripWhitespace = (str) => filterCharacters(str, notWhitespace);

function expandRange(shorthand) {
  let lastEncountered = 0;

  function addBase(strNum) {
    let value = Number(strNum);
    const base = BASE ** strNum.length;
    while (value < lastEncountered) {
      value += base;
    }

    lastEncountered = value;
    return value;
  }

  function fillRange(rnge) {
    const len = rnge[rnge.length - 1] - (rnge[0] - 1);
    return range(len, rnge[0]);
  }

  function processElement(em) {
    if (containsSeparators(em)) {
      return fillRange(em.split(SEPARATORS).map(addBase));
    } else {
      return addBase(em);
    }
  }

  return stripWhitespace(shorthand).split(',').flatMap(processElement);
}


// Examples Given
// console.log(expandRange('1, 3, 7, 2, 4, 1'));
// "1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
// This example demonstrates that when a number is encountered which is lower than the previous number,
// a significant digit has been omitted. Since this is base 10, we would add ten to the lower number.
// It also shows us that ranges are separated by commas. We are not given numbers, we are provided a list of ranges.

// console.log(expandRange('1-3, 1-2'));
// "1-3, 1-2" --> 1, 2, 3, 11, 12
// This example illustrates that multiple ranges may be provided as a continuation of the original range.
// The second range begins at a lower number than the final number in the first range, indicating an addition of 10.

// console.log(expandRange('1:5:2'));
// "1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12
// This example shows a shorthand for multiple ranges. Instead of a comma separated list, we are given
// a range with three keyframes.
// It also implicitly suggests that the middle number serves only to demonstrate a change in base.
//   The five could be any single-digit number higher than 2 and it would function the same.

// console.log(expandRange('104-2'));
// "104-2" --> 104, 105, ... 112
// This example shows us that the numbers do not have to be small, and function the same way in larger numbers.

// console.log(expandRange('104-02'));
// "104-02" --> 104, 105, ... 202
// This example shows us that the number of digits included in the smaller number (proceeding a larger number)
//   indicates the exponent of the base that we need to increment by in order to obtain the proper keyframe.

// console.log(expandRange('545, 64:11'));
// "545, 64:11" --> 545, 564, 565, .. 611
// This example shows us that a given number need not be a range.
// It also reminds us that when there are no separators present, there are no additional numbers between the ranges.

// personal test cases
console.log(expandRange('1:4, 2:4, 1:9')); // [1, 2, 3, 4, 12, 13, 14, 21, 22, 23, 24, 25, 26, 27, 28, 29]
console.log(expandRange('5, 002:9'));      // [5, 1002, 1003 ... 1009]
