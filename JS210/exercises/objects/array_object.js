// Array Object Part 1

// first line logs 'a'
// second line logs undefined
// line 10 logs 'd'
// line 11 logs 5
// line 12 logs something like ['a', 'b', 'c', 'f', e: 5]

// ohhh, i messed up and forgot that it would log the negative, just not enumerate over it.

// Part Two

// i remember that negative indices do NOT count towards the lenth property, so the average will return 10 instead of 5

// further exploration (refactor)
const myArray = [5, 5];
myArray[-1] = 5;
myArray[-2] = 5;

function average(array) {
  let sum = 0;

  for (let i = -2; i < array.length; i += 1) {
    sum += array[i];
  }

  return sum / Object.keys(array).map(n => Number(n)).length;
}

console.log(average(myArray) === 5);
