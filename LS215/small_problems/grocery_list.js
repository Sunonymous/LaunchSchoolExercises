"use strict";

function clone(item, times) {
  if (times < 0) return [];
  let result = [item];

  function recur(arr) {
    if (arr.length === times) {
      return arr;
    } else {
      arr.push(item);
      return recur(arr);
    }
  }

  if (result.length === times) {
    return result;
  } else {
    return recur(result);
  }
}

const buyFruit = (fruits) => fruits.flatMap(([fruit, count]) => clone(fruit, count));

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
