'use strict';
const log = (v) => console.log(v);

// Child Nodes

// Originally I forgot all the whitespace, though I added them in.

// 1 (div)
// Child Count
//   9 (whitespace, h1, whitespace, p, whitespace, a, whitespace, div, whitespace)
// Indirect Child Count
//   - (text, em, text, span, text, strong, p)

// 2 (h1)
// Child Count
//   2 (text, em)
// Indirect Child Count
//   1 (text)

// 3 (em)
// Child Count
//   1 (text)
// Indirect Child Count
//   0

// 4 (p)
// Child Count
//   4 (whitespace, text, span, text)
//   3 (was correct)
// Indirect Child Count
//   1 (text)

// 5 (span)
// Child Count
//   1 (text)
// Indirect Child Count
//   0

// 6 (a)
// Child Count
//   1 (strong)
// Indirect Child Count
//   1 (text)

// 7 (strong)
// Child Count
//   1 (text)
// Indirect Child Count
//   0

// 8 (div)
// Child Count
//   1 (p)
// Indirect Child Count
//   2 (a, text)

// 9 (p)
// Child Count
//   1 (a)
// Indirect Child Count
//   1 (text)

// 10 (a)
// Child Count
//   1 (text)
// Indirect Child Count
//   0

