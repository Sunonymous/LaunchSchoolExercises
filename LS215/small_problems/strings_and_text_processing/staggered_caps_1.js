'use strict';

// given a string, return a string with the same content in "staggered caps"
//   case staggered by index

const staggeredCase = (original) => {
  let capitalize = true;

  function recur(str) {
    if (str.length === original.length) {
      return str;
    } else {
      let char = original[str.length];
      let nextChar = capitalize ? char.toUpperCase() : char.toLowerCase();
      capitalize = !capitalize;
      return recur(str + nextChar);
    }
  }

  let result = '';
  return recur(result);
}

console.log('Test Results:');
console.log(staggeredCase('I Love Launch School!') === "I LoVe lAuNcH ScHoOl!");
console.log(staggeredCase('ALL_CAPS') === "AlL_CaPs");
console.log(staggeredCase('ignore 77 the 4444 numbers') === "IgNoRe 77 ThE 4444 nUmBeRs");
