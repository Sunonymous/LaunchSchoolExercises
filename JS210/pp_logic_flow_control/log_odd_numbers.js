// never know where to put these files

// functional style
let isOdd = num => num % 2 !== 0;

function logOddNumbers1(upto) {
  range = [...Array(upto + 1).keys()]
  range.filter(isOdd).map(n => console.log(n));
}

// further exploration
// increment double
function logOddNumbers2(upto) {
  for (let i = 1; i <= upto; i += 2) {
    console.log(i);
  }
}

// skip evens
function logOddNumbers3(upto) {
  for (let i = 0; i <= upto; i++) {
    if (i % 2 === 0) continue;

    console.log(i);
  }
}

logOddNumbers1(6);
logOddNumbers2(6);
logOddNumbers3(6);
