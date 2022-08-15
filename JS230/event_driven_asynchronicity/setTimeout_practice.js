'use strict';

const MS_IN_SEC = 1000;

function delayLog() {
  const intervals = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  intervals.forEach((n) => {
    setTimeout(() => console.log(n), n * MS_IN_SEC);
  });
}

// delayLog();

// 2

setTimeout(() => {           // 1
  console.log('Once');       // 5
}, 1000);                    //

setTimeout(() => {           // 2
  console.log('upon');       // 7
}, 3000);                    //

setTimeout(() => {           // 3
  console.log('a');          // 6
}, 2000);                    //

setTimeout(() => {           // 4
  console.log('time');       // 8
}, 4000);                    //

// 3
// f, g, d, z, n, s, q
// okay, supposedly g is before f

// 4
function afterNSeconds(n, f) {
  setTimeout(f, n * 1000);
}

afterNSeconds(2, () => console.log('Two seconds later...'));
