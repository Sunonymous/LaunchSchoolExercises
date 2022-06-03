'use strict';

const log = (v) => console.log(v);

// 1
const capitalize = (s) => s[0].toUpperCase() + s.substring(1);

const greet = (greeting, target) => log(`${capitalize(greeting)}, ${target}!`);

// greet('howdy', 'Joe');
// greet('good morning', 'Sue');

function partial(primary, arg1) {
  return function(arg2) {
    return primary(arg1, arg2);
  };
}

// 2
const sayHello = partial(greet, 'hello');
const sayHi    = partial(greet, 'hi');
const sayYo    = partial(greet, 'yo');

// sayHello('Brandon');
// sayHi('Sarah');
// sayYo('Gabba Gabba');

// PRACTICE PROBLEMS

// 1
const subtract = (a, b) => a - b;
const sub5     = (a) => subtract(a, 5);

log(sub5(10) === 5); // 5
log(sub5(20) === 15); // 15

// 2
const makeSubN = (n) => (x) => subtract(x, n);
const sub77    = makeSubN(77);
log(sub77(88) === 11);

// 3
const makePartialFunc = (func, b) => (c) => func(b, c);

const multiply = (a, b) => a * b;
const multiplyBy5 = makePartialFunc(multiply, 5);
const multiplyBy9 = makePartialFunc(multiply, 9);

log(multiplyBy5(100) === 500);
log(multiplyBy9(11)  === 99);

// 4
// The function's closure maintains references to variables within the function's scope at the time of declaration/expression.

// 5
let subjects = {
  English: ['Bob', 'Tyrone', 'Lizzy'],
  Math: ['Fatima', 'Gary', 'Susan'],
  Biology: ['Jack', 'Sarah', 'Tanya'],
};

function rollCall(subject, students) {
  console.log(subject + ':');
  students.forEach(function(student) {
    console.log(student);
  });
}

const makeMathRollCall = () => rollCall.bind(null, 'Math');

let mathRollCall = makeMathRollCall();
mathRollCall(subjects['Math']);
// => Math:
// => Fatima
// => Gary
// => Susan
