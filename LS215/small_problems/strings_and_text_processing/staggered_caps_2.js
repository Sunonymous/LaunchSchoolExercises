'use strict';

// given a string, return a string with the same content in "staggered caps"
//   case staggered by alternation

const staggeredCase = (original) => {
  const isLetter = (c) => c.match(/[a-z]/i);
  let capitalize = true;

  function recur(str) {
    if (str.length === original.length) {
      return str;
    } else {
      let char = original[str.length];
      if (isLetter(char)) {
        let nextChar = capitalize ? char.toUpperCase() : char.toLowerCase();
        capitalize = !capitalize;
        return recur(str + nextChar);
      } else {
        return recur(str + char);
      }
    }
  }

  let result = '';
  return recur(result);
}

console.log('Test Results!');
console.log(staggeredCase('I Love Launch School!') === "I lOvE lAuNcH sChOoL!");
console.log(staggeredCase('ALL CAPS') === "AlL cApS");
console.log(staggeredCase('ignore 77 the 444 numbers') === "IgNoRe 77 ThE 444 nUmBeRs");
