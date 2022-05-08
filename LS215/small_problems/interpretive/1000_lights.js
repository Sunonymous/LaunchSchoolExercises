'use strict';

/*
P
Description
Given positive integer `n`, create an array of 'lights', each beginning in an off state. `n` number of times,
walk through the bank of lights and toggle their state. Each iteration toggles every `n` light, meaning that
the first iteration toggles them all, the second iteration every other light, the third iteration every third,
etc. Return an array containing the position of the lights which are currently on after all of the passes.

IO
  Input  -> Int Number of Lights
  Output -> Array of Active Lights after processing
Rules
  All lights begin the processing in an 'on' state.
  Lights are toggled starting at the index of the iteration and successively adding the index
    until the index meets or exceeds the number of lights.
  Always the same number of lights as the given integer.
Notes
  Lights appear to be 1-indexed rather than 0-indexed. This will affect calculations.
    Could decide to process with 0-based indexes and adjust, or simply use a range starting from 1.
  Let's try a new edge case strategy. We'll run a function which either returns null if no edge cases
    are encountered with the given input, or the return value necessitated by the edge case.
    If the function's return value is not null, the primary function simply returns it.
Questions
  Will the input always be positive? What if it is not?
  How will the program handle improper variables?
E
  Improper Input
    log(lightsOn(0)); // []
    log(lightsOn('')); // []
  General Tests
    log(lightsOn(1)); // [1]
    log(lightsOn(2)); // [1]
    log(lightsOn(3)); // [1]
    log(lightsOn(4)); // [1, 4]
    log(lightsOn(5)); // [1, 4]
    log(lightsOn(100)); // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
D
  We will obviously be needing to use an array, as this is the return value.
  We may use booleans as an interim type, as this will ease the value of toggling the lights.
A
  Check for edges and return appropriate values.
  Create an array of `n` number of `false` values.
  Iterate `n` number of times, ie. 1-n. On each iteration:
    Create a range of indexes with a particular step corresponding to the number of the iteration.
    Toggle each of the boolean values at every index generated.
  Map the resulting active lights to their indexes, filter out the null values, and return it.
F
  stepRange      -> generate range via step
  multiplyValue  -> multiply a particular literal value into an array of itself `n` times
  toggle         -> given a boolean (or anything to be cast to its truthiness), return it negated
  increment      -> given an integer, return the integer plus one
  mapOverIndexes -> given an array, an array of indexes, and a function, apply the function to
                   the value at each of the given indexes and return it
C
*/

const log         = (x) => console.log(x);
const beginTests  = (func) => log(`Test Results for Function ${func.name}:`);
const pass        = '\x1b[32mPASSED\x1b[0m -- ';
const fail        = '\x1b[31mFAILED\x1b[0m -- ';
const pp          = (val) => Array.isArray(val) ? `[${val.join(', ')}]` : val;
const manoTest    = (func, ...vals) => log(`TEST   -- ${func.name}(${vals.map(pp).join(', ')}) -> ${pp(func(...vals))}`);
const autoTest    = (func, expected, ...vals) => {
  const returnVal = func(...vals);
  const details   = `${func.name}(${vals.map(pp).join(', ')}) -> ${pp(expected)}`;
  const success   = pass + `${details}`;
  const failure   = fail + `${details} (returned ${pp(returnVal)})`;
  const result    = returnVal === expected ? success : failure;
  log(result);
}

const checkEdges     = (n) => (!Number.isInteger(n) || n < 1) ? [] : null;
const toggle         = (x) => !x;
const increment      = (n) => n + 1;
const stepRange      = (start, max, step) => {
  let result = [];
  for (let i = start; i <= max; i += step) {
    result.push(i);
  }
  return result;
}

const mapOverIndexes = (arr, indexes, func) => {
  indexes.forEach((idx) => arr[idx] = func(arr[idx]));
  return arr;
}

const multiplyValue = (val, times) => {
  if (!Array.isArray(val)) val = [val];
  if (val.length >= times) {
    return val.slice(0, times);
  } else {
    return multiplyValue([...val, ...val], times);
  }
}

function lightsOn(numberOfLights) {
  const edge = checkEdges(numberOfLights);
  if (edge !== null) return edge;

  let lights = multiplyValue(false, numberOfLights);
  lights.unshift(null); // to account for 0 indexing

  for (let i = 1; i <= numberOfLights; i += 1) {
    const indexes = stepRange(i, numberOfLights, i);
    mapOverIndexes(lights, indexes, toggle);
  }

  return lights.map((l, idx) => l ? idx : null)
               .filter((l) => l !== null);
}

beginTests(lightsOn);
manoTest(lightsOn, '');  // []
manoTest(lightsOn, 0);   // []
manoTest(lightsOn, 1);   // [1]
manoTest(lightsOn, 2);   // [1]
manoTest(lightsOn, 3);   // [1]
manoTest(lightsOn, 4);   // [1, 4]
manoTest(lightsOn, 5);   // [1, 4]
manoTest(lightsOn, 100); // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
