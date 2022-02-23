// Index of Substring

// LS had poor parameter names in these functions. They give no indication (without looking at a written explanation of the function) as to their use.

// two functions,
//   indexOf     -> returns the first instance of a string within another string, or -1 if they do not match
//   lastIndexOf -> returns the last instance of a string within another string, or -1 if they do not match
// CONSTRAINTS
//   cannot use any methods apart from `[]` and `.length` in the String class
//   (does this mean i could write my own substring method? I don't see why not...)


function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function makeSubstring(str, start, length) {
  if (str === '' || start + length > str.length) {
    return null;
  } else {
    let result = '';
    let idx    = start;
    do {
      result += str[idx];
      idx++;
    } while (result.length < length);
    return result;
  }
}

function findAllSubstrings(dataString, queryString) {
  const rng = range(dataString.length - queryString.length, 0);
  const substrings = rng.filter((idx) => {
    return makeSubstring(dataString, idx, queryString.length) === queryString;
  });
  return substrings;
}

function indexOf(dataString, queryString) {
  const substrings = findAllSubstrings(dataString, queryString);
  return substrings.length === 0 ? -1 : substrings[0];
}

function lastIndexOf(dataString, queryString) {
  const substrings = findAllSubstrings(dataString, queryString);
  return substrings.length === 0 ? -1 : substrings[substrings.length - 1];
}

// couldn't end up finishing this one without dedicated tests
// was running into a strange issue, though it was solved in the second iteration

const RUN_TESTS = true;

if (RUN_TESTS) {
  let results = [];
  results.push(makeSubstring('howdy', 1, 2) === 'ow');
  results.push(makeSubstring('', 1, 2) === null);
  results.push(makeSubstring('wait!', 3, 3) === null);
  console.log(results);
}

console.log(indexOf('Some strings', 'st'));                      5
console.log(indexOf('Blue Whale', 'Whale'));                    5
console.log(indexOf('Blue Whale', 'Blute'));                    -1
console.log(indexOf('Blue Whale', 'leB'));                      -1
console.log(lastIndexOf('Some strings', 's'));                  11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    -1
