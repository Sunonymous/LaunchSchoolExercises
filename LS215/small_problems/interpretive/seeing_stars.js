'use strict';

// the location may have to be altered within each distinct folder
const test = require('../../tester');
const t = test.makeTestSuite();

/*
Problem-->
  Description~
  -- Given an odd integer no less than 7, log an 8-pointed star to the console.
  IO~
  -- Input  -> Odd integer `size`
  -- Output -> Undetermined, side-effect of logged 8-pointed star.
  -- Edges  -> Non-odd integer, non-number input
  Rules~
  -- Star characters are given as asterisks.
  -- Each star consist of an upper half of three branching paths, a solid line in the center
  ---- equal to the size of the full star, and a lower half which (a reversal of the upper half).
  -- The branching paths of the star follow a pattern. They start with 3 asterisks in the center
  ---- of the star, surrounded by spaces on both sides.
  -- Each successive line further from the center moves one of the outer spaces in between each of the
  ---- inner asterisks.
  Notes~
  -- This one seems like it cares about improper input, so I'll attend to that.
Examples-->
  -- Template
  -- Tests for Improper Input
    -- star(2)    => ''
    -- star(null) => ''
    -- star([9])  => ''
  -- Tests for Normal Operation
    -- star(7)
    -- star(9)
    -- star(11)
Data Structure-->
  -- Let's use arrays again. They worked nicely for the diamond exercise.
Algorithm-->
-- This time we will use imperative style code.
-- Start by generating the lower half of the star.
-- Start a for loop on the number of outer spaces, from (size - 3) / 2 down to 1 inclusive.
---- LOOP
---- Create a variable innerSpaces and set it to (size - 3) - (outerSpaces * 2).
---- Append a line to the lower-half consisting of ' ' * outerSpaces concatenated with the center
------ asterisks with innerSpaces between each of them.
---- Increment inner spaces by one on each iteration.
-- Slice the lower half and reverse it to get the upper half.
-- Create a full star array by adding the upper half, a full line of asterisks totaling the
---- star's size, and the lower half into a single array.
-- Return this full star joined by newlines.
*/

// Edges
const edgeCheck = (size) => {
  if (size % 2 !== 1 || typeof size !== 'number' || size < 7) return '';
  return null;
}

// Primary

const STAR_CHAR     = '*';
const NON_STAR_CHAR = ' ';

function star(size) {
  const isEdge = edgeCheck(size);
  if (isEdge !== null) return isEdge;

  const lowerHalf = [];
  let   innerSpaceCount = 0;

  for (let outerSpaces = (size - 3) / 2; outerSpaces >= 0; outerSpaces -= 1) {
    const outSpaces   = NON_STAR_CHAR.repeat(outerSpaces);
    const innerSpaces = NON_STAR_CHAR.repeat(innerSpaceCount);
    const starChars   = `${STAR_CHAR}${innerSpaces}${STAR_CHAR}${innerSpaces}${STAR_CHAR}`;
    lowerHalf.push(`${outSpaces}${starChars}`);
    innerSpaceCount += 1;
  }

  const centerLine = STAR_CHAR.repeat(size);
  const upperHalf  = [...lowerHalf].slice().reverse();
  const fullStar   = [...upperHalf, centerLine, ...lowerHalf].join('\n');

  // uncomment this line if tests are no longer needed
  // console.log(fullStar);
  return fullStar;
}

t.addTest(star, '', 2);
t.addTest(star, '', null);
t.addTest(star, '', [9]);
t.addTest(star, '*  *  *\n * * *\n  ***\n*******\n  ***\n * * *\n*  *  *', 7);
t.addTest(star, '*   *   *\n *  *  *\n  * * *\n   ***\n*********\n   ***\n  * * *\n *  *  *\n*   *   *', 9);
t.addTest(star, '*    *    *\n *   *   *\n  *  *  *\n   * * *\n    ***\n***********\n    ***\n   * * *\n  *  *  *\n *   *   *\n*    *    *', 11);
t.runSuite();
