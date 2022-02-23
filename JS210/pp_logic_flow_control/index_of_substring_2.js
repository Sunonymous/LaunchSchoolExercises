// Second Try
// Time to break in the new testing functionality!
const T = require('./test_suite.js');
let ts = T.testSuite('testSubstrings');

// To get all substrings functionally, we--
//   filter over a range of indexes comprising the length of the primary string (pl) minus the length of the substring (sl) by the evaluation of whether or not the given substring matches the query substring
//     to get the range, we use the helper function to create a range from 0 up until
//       the calculation of pl - sl
//     if the resulting substrings match the query substring, the arrays will be preserved

// To get a substring, we--
//   account for the edge cases (empty string, substring too long)
//   create a range of indexes in the string,
//     we are given the starting index (i) and the length of the substring (l)
//     we create a range from (i) to (l) using the helper function above
//   map them to their characters,
//     using a normal map operation
//   and then join them together.
//     using the standard Array.prototype.join functionality.

// To get the index of the first substrings, return the first out of the total substring indexes. There should always be at least a single element.
//   This applies just as well to the last with the last of the indexes.

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function substring(str, start, length = -1) {
  if (str === '') {
    return '';
  } else if (start + length > str.length || length === -1) {
    length = str.length - start;
  }
  const stringIndexes = range(length, start);
  const stringCharacters = stringIndexes.map(c => str[c]);
  return stringCharacters.join('');
}
// my first tests ... seems reasonable
ts.makeTest('Substring Works'         , 'owd',   () => substring('howdy!', 1, 3));
ts.makeTest('Substring Carries Onward', 'owdy!', () => substring('howdy!', 1));
ts.makeTest('Substring Fixes Greed'   , 'wdy!',  () => substring('howdy!', 2, 9));
ts.makeTest('Substring Fixes Laziness', 'dy!',   () => substring('howdy!', 3));

function substringIndexes(dataString, queryString) {
  if (queryString === '' || queryString.length >= dataString.length) {
    return [-1];
  } else {
    const indexesToSearch = range(dataString.length - queryString.length + 1, 0); // this + 1 confuses me
    const searchResults = indexesToSearch.filter(i => substring(dataString, i, queryString.length) === queryString);
    return searchResults.length === 0 ? [-1] : searchResults;
  }
}

const shortString = 'How are you doing today, my glorious neighbor?';
const longerString = 'I probably sh-sh-should sh-st-stutter a bit less.';
const longestString = 'Whenever you are lost and cannot find your way, go ahead and change your mind.';
ts.makeTest('substringIndexes is negative upon failure',  [-1],              () => substringIndexes(shortString, 'fish'));
ts.makeTest('substringIndexes works with two characters', [11, 14, 17, 24], () => substringIndexes(longerString, 'sh'));
ts.makeTest('substringIndexes works with one character',  [17],             () => substringIndexes(longestString, 'l'));

function indexOf(dataString, queryString) {
  return substringIndexes(dataString, queryString)[0];
}

function lastIndexOf(dataString, queryString) {
  const found = substringIndexes(dataString, queryString);
  return found[found.length - 1];
}

const phrase = 'remember to remind me to remember'
ts.makeTest('indexOf works with successful query',      2, () => indexOf(phrase, 'mem'));
ts.makeTest('indexOf works with unsuccessful query',   -1, () => indexOf(phrase, 'xxx'));
ts.makeTest('indexOf works with broken query',         -1, () => indexOf(phrase, ''));
ts.makeTest('indexOf works with long query',           -1, () => indexOf(phrase, 'exceedingly long query string of malicious intent'));

// LS Tests

ts.makeTest('LS Test 1',  5, () => indexOf('Some strings', 's'));
ts.makeTest('LS Test 2',  5, () => indexOf('Blue Whale', 'Whale'));
ts.makeTest('LS Test 3', -1, () => indexOf('Blue Whale', 'Blute'));
ts.makeTest('LS Test 4', -1, () => indexOf('Blue Whale', 'leB'));
ts.makeTest('LS Test 5', 11, () => lastIndexOf('Some strings', 's'));
ts.makeTest('LS Test 6', 19, () => lastIndexOf('Blue Whale, Killer Whale', 'Whale'));
ts.makeTest('LS Test 7', -1, () => lastIndexOf('Blue Whale, Killer Whale', 'all'));

ts.analyzeResults();
