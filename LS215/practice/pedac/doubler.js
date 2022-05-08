// Practice writing test cases

// - elements that are numbers should be multiplied by 2
console.log(doubler([1, 2, 3])); // [2, 4, 6]
// - elements that are strings should be repeated twice via concatenation
console.log(doubler(['lol', 'wut', 'why'])); // ['lollol', 'wutwut', 'whywhy']
// - other types of elements should be duplicated in the array
console.log(doubler([[':)']])); // [[':)'], [':)']]
// - the input array should not be mutated
const first = x;
const second = doubler(x);
console.log(first !== second); // true
// - elements that are special number values should remain unchanged
console.log(doubler([1, NaN, 3])); // [2, NaN, 6]
// - elements that are any other type of number should be treated normally (multiplied by 2)
console.log(doubler([4, 5, 6])); // [8, 10, 12]
// - elements that are empty strings should remain unchanged
console.log(doubler(['hi', ''])); // ['hihi', '']
// - elements that are any other type of string should be treated normally (repeated twice)
console.log(doubler(['a', 'b', 'c'])); // ['aa', 'bb', 'cc']
// - the input array can contain a mixture of different types of elements
console.log(doubler(['a', 1, 7, {}])); // ['aa', 2, 14, {}, {}]
// - non-primitive elements should have their reference duplicated, not their value
const result = doubler([[1]]);
console.log(result[0] === result[1]); // true
// - elements that appear more than once should be treated normally (as specified above)
console.log(doubler([1, 1, 1])); // [2, 2, 2]
// - elements that contain nested arrays or objects should be treated normally (duplicated)
console.log(doubler([[1, [2], 3]])); // [[1, [2], 3], [1, [2], 3]]
// - if the input array contains empty slots (a "sparse array"), they should be removed
console.log(doubler([1, , , , 5])); // [2, 10]
// - if an inner array (element) contains empty slots, they should remain unchanged
console.log(doubler([[1, , , 3]])); // [[1, , , 3], [1, , , 3]]
// - if the input array contains any object properties, they should remain unchanged
const arr = [1];
arr['wuzzup'] = 1996;
console.log(Object.hasOwnProperty(doubler(arr), 'wuzzup')); // true
// - if an inner array (element) contains any object properties, they should remain unchanged
const newArr = doubler([[arr]]);
console.log(Object.hasOwnProperty(newArr[0][0]), 'wuzzup'); // true
// - if the array is empty, return an empty array
console.log(doubler([])); // []
// - if multiple arguments are passed, ignore all but the first
console.log(doubler([7], [1, 2, 3])); // [14]
// - if the argument is a string, treat it as an array of characters
console.log(doubler('hello')); // ['hh', 'ee', 'll', 'll', 'oo']
// - if the argument is a non-negative integer, treat it as an array of digits
console.log(doubler(54)); // [10, 8]
// - if the argument is an object, treat it as an array of its property values
console.log(doubler({a: 1, b: 2})); // [2, 4]
// - all other kinds of inputs are invalid, and should return the string 'Invalid input'
console.log(doubler(-7)); // 'Invalid input'
