// Odd Numbers

// I'll stick to procedural on this one. I'm tired of copying range on every single exercise...

/*
for (let i = 1; i < 100; i++) {
  if (i % 2 === 0) continue;
  console.log(i);
}
*/

// further exploration

function logOddsToN(n) {
  for (let i = 1; i <= n; i++) {
    if (i % 2 === 1) console.log(i);
  }
}

console.log(logOddsToN(99));
