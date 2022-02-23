// Even Numbers

// for the sake of boredom, i'll do this (semi-) functionally... WITHOUT range

function numbersFrom1toN(n) {
  let result = [];
  for (let i = 2; i <= n; i += 2) {
    if (i % 2 === 0) {
      result.push(i);
    }
  }
  return result;
}

numbersFrom1toN(99).forEach(n => console.log(n));
