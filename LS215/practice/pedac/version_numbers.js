'use strict';

// Version Number Comparison

// P
//   Given two legal version numbers, calculate which is "higher", and return:
//     1 if the first numbers is greater
//    -1 if the second number is greater
//     0 if the numbers are equal
//   null if either number contains anything except digits and periods
//   With proper input, one number will be greater or they will be the same.
//   With improper input, we should return null.
// Examples below
// D
//   Input: version numbers must be strings
//   Interrim: we'll use arrays to separate the version segments.
//   Output: Integer, either -1, 0, or 1
// A
//   First we validate our input using a regular expression.
//   If the input is invalid, return null.
//   If the input is valid, split both version numbers into arrays of "segments", by splitting them by periods.
//   Map over the segments to cast them to numbers.
//   If the first array has less segments than the second
//   -> Compare the version segment at the last index of the first array with the segment at the same index of the second array.
//   Else
//   -> Compare the version segment at the last index of the second array with the segment at the same index of the first array.
//   If the selected segments are equal...
//   -> Return 0.
//   Else if the first is greater...
//   -> Return 1.
//   Else
//   -> Return -1.
// C

// Notes
// A valid version number string will contain only digits and periods.
// We will reference the last number, ie. the number after the last period,
//   of the version number with the least amount of "segments" to determine the comparison.
// The else branch of the if statement functions just as well for the cast when they are the same length. No third branch is needed.
// We are not returning the greater/smaller of the two, we are returning a separate value derived via the comparison.
// The comparison logic can be separated into a separate function, as can the regex version validation.
// What if the version ends in a period instead of a digit? Splitting on periods should avoid any issues with that.
// This regex does not work if the periods do not contain numbers between them.
//   Could be improved, but not right now.

const DEBUG = false;

// original regex... imperfect! learning from the ls example
// const versionRegex = /^\d[\d\.]*$/;
const versionRegex = /^\d+(\.\d+)*$$/;
const validVersion = (version) => !!version.match(versionRegex);

const comparison = (first, second) => {
  if (first > second) {
    return 1;
  } else if (second > first) {
    return -1;
  } else {
    return 0;
  }
}

function compareVersions(version1, version2) {
  if (!validVersion(version1) || !validVersion(version2)) return null;
  version1 = version1.split('.').map(Number);
  version2 = version2.split('.').map(Number);
  const indexToCompare = Math.min(version1.length, version2.length) - 1;

  // edge case that messes up this "simple" algorithm
  if (version1.length !== version2.length && version1[indexToCompare] === version2[indexToCompare]) {
    return version1.length > version2.length ? comparison(version1[version1.length - 1], 0) : comparison(0, version2[version2.length - 1]);
  } else {
    return comparison(version1[indexToCompare], version2[indexToCompare]);
  }
}

if (DEBUG) {
  //console.log(validVersion(' 1.1.2.53'));
  console.log(compareVersions('1.2.0.0', '2.5'));
} else {
  console.log('Test Results:');
  console.log(compareVersions('0.1', '1') === -1);
  console.log(compareVersions('1', '1.0') === 0);
  console.log(compareVersions('1.0', '1.1') === -1);
  console.log(compareVersions('1.2', '1.1') === 1);
  console.log(compareVersions('1.2', '1.2.0.0') === 0);
  console.log(compareVersions('1.2.0.0', '1.18.2') === -1);
  console.log(compareVersions('1.18.2', '13.37') === -1);
  console.log(compareVersions('1', '2') === -1);
  console.log(compareVersions('0', '-4') === null);
  console.log(compareVersions('1', '1.') === null);
  console.log('LS Test Case Results:');
  console.log(compareVersions('1', '1') === 0);            // 0
  console.log(compareVersions('1.1', '1.0') === 1);        // 1
  console.log(compareVersions('2.3.4', '2.3.5') === -1);    // -1
  console.log(compareVersions('1.a', '1') === null);          // null
  console.log(compareVersions('.1', '1') === null);           // null
  console.log(compareVersions('1.', '2') === null);           // null
  console.log(compareVersions('1..0', '2.0') === null);       // null
  console.log(compareVersions('1.0', '1.0.0') === 0);      // 0
  console.log(compareVersions('1.0.0', '1.1') === -1);      // -1
  console.log(compareVersions('1.0', '1.0.5') === -1);      // -1
}

// Using Non-technical Language
// Two version numbers may be compared using natural numerical comparison of the last segment
// of the shortest version number with the segment at the same position in the other version.
// In the case that the version numbers are the same length (in terms of number of segments, not numbers themselves),
// the last segment of both are compared.

// Well, excepting that last edge case that I hadn't caught, it was nearly successful!
// It could be worth rewriting the algorithm. Mine *was* straightforward until that edge case, though
//   appending functionality for that case made it quite ugly.
// We could automatically append zeroes to fill in the missing segments.
// The LS solution is pretty straightforward and simple, though I don't want to copy it.
