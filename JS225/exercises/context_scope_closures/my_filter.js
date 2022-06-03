'use strict';

const log = (v) => console.log(v);

function myFilter(array, func, context = null) {
  const result = [];

  func = func.bind(context);
  for (let i = 0; i < array.length; i += 1) {
    if (func(array[i])) result.push(array[i]);
  }

  return result;
}

const filter = {
  allowedValues: [5, 6, 9],
};

log(myFilter([2, 1, 3, 4, 5, 6, 12], function(val) {
  return this.allowedValues.includes(val);
}, filter)); // returns [5, 6]
