"use strict";

// given a string, evaluate whether the parentheses are balance,
//   ie. there are an equal number of open and closing parentheses,
//     and in their "proper" sequence

const isBalanced = (string) => {
  let level = 0;

  for (let idx = 0; idx < string.length; idx += 1) {
    if (string[idx] === '(') {
      level += 1;
    } else if (string[idx] === ')') {
      level -= 1;
    };

    if (level < 0) return false;
  }

  return level === 0;
}

console.log('BalancedParentheses Test Results');
console.log(!!isBalanced('What (is) this?'));
console.log(!isBalanced('What is) this?'));
console.log(!isBalanced('What (is this?'));
console.log(!!isBalanced('((What) (is this))?'));
console.log(!isBalanced('((What)) (is this))?'));
console.log(!!isBalanced('Hey!'));
console.log(!isBalanced(')Hey!('));
console.log(!isBalanced('What ((is))) up('));
