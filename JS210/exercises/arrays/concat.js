// Concat Part One

// similar to our last one, but expanded!
// HERE ARE THE RULES
// first argument is an array
// second argument may be an array or a value
// function should NOT mutate array
// elements in returned array should appear in the same order given
// second argument should be added by reference if an object
// second argument should be added by value if a primitive

// first let's try just simply pushing
// took a minute to sort the differences out
function concat(array1, val) {
  let result = array1.slice();
  if (Array.isArray(val)) {
    result.push(...val);
  } else {
    result.push(val);
  }
  return result;
}

/*
console.log(concat([1, 2, 3], [4, 5, 6]));          // [1, 2, 3, 4, 5, 6]
console.log(concat([1, 2], 3));                     // [1, 2, 3]
console.log(concat([2, 3], ['two', 'three']));      // [2, 3, "two", "three"]
console.log(concat([2, 3], 'four'));                // [2, 3, "four"]

const obj = { a: 2, b: 3 };
const newArray = concat([2, 3], obj);
console.log(newArray);                              // [2, 3, { a: 2, b: 3 }]
obj.a = 'two';
console.log(newArray);

const arr1 = [1, 2, 3];
const arr2 = [4, 5, obj];
const arr3 = concat(arr1, arr2);
console.log(arr3);                                  // [1, 2, 3, 4, 5, { a: "two", b: 3 }]
obj.b = 'three';
console.log(arr3);                                  // [1, 2, 3, 4, 5, { a: "two", b: "three" }]

arr3[5].b = 3;                         // or, `arr3[5]['b'] = 3;`
console.log(obj);                                   // { a: "two", b: 3 }
*/

// Part Two
// not a huge change needed

function concat(array1, ...vals) {
  let result = array1.slice();
  vals.forEach(em => {
    if (Array.isArray(em)) {
      result.push(...em);
    } else {
      result.push(em);
    }
  })
  return result;
}
console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9]));    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat([1, 2], 'a', ['one', 'two']));        // [1, 2, "a", "one", "two"]
console.log(concat([1, 2], ['three'], 4));               // [1, 2, "three", 4]
