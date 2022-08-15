'use strict';

// 1
let count = 0;
let counter;

function startCounting() {
  counter = setInterval(() => {
    count += 1;
    console.log(count);
  }, 1000);
}

// 2
function stopCounting() {
  clearInterval(counter);
}
