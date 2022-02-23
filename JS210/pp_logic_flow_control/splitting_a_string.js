// Tests
const T = require('./test_suite.js');
let tester = T.testSuite('testSubstrings');

// Splitting a String
// Not sure about doing this one functionally. Nothing comes to mind immediately.

// Via procedural treatment:
// Return the appropriate error message if the delimiter is not provided (instead of providing a default...?)
// We create an empty array,
// We create a  section variable as an empty string,
// We loop through the string via indexing up to its length (exclusive)
//   On each iteration we check if the character at the current index is a delimiter
//     If so:
//       We add the content of the section variable to the results array,
//       We reset the section variable to empty ('')
//       We increment the index variable (done automatically in a for loop)
//     If not:
//       We add the character at the index to the section variable
//       We increment the index variable
// Seems like this could be done recursively, too. Not for the first attempt, though!
// LS wants side effects too.... learning so many things about this!

function splitString(string, delimiter) {
  if (string.length === 0) {
    console.log('ERROR: Cannot split empty string.');
  } else if (delimiter === undefined) {
    console.log('ERROR: delimiter must be provided, apparently.');
  } else {
    let results = [];
    let section = '';
    for (let idx = 0; idx <= string.length; idx++) {
      if (delimiter === '' && idx < string.length) { // second conditional clause was because undefined was being pushed to the array
        section += string[idx]; // adds char at point with empty delimiter
      }
      if (string[idx] === delimiter || idx === string.length || delimiter == '') {
        results.push(section);
        section = '';
      } else {
        section += string[idx];
      }
    }
    if (results[results.length - 1] === '') results.pop(); // in case empty element was added originally
    results.forEach(em => console.log(em));
  }
}

// these tests worked when the function returned the error instead of logging it
// can't test this splitting function completely because side effects don't play nicely with my tests
// tester.makeTest('Split fails on empty string',   'ERROR: Cannot split empty string.',              () => splitString('', ','));
// tester.makeTest('Split fails without delimiter', 'ERROR: delimiter must be provided, apparently.', () => splitString('lol'));

// splitString('abc,123,hello world', ','); // successful
// splitString('hello');                    // successful
// splitString('hello', '');                // successful
// splitString('hello', ';');               // successful
// splitString(';hello;', ';');             // successful (after some finagling)

// tester.analyzeResults(); // useless now...
