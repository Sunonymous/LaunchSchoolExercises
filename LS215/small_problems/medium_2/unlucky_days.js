'use strict';

// the location may have to be altered within each distinct folder
const TESTER = require('../../tester');
const t = TESTER.makeTestSuite();

/*
Problem-->
Given an integer year, return the number of days in that year
which are Friday and the 13th of the month.
-- IO
---- Input  -> Integer Year > 1752
---- Output -> Integer number of
---- Edges  -> Invalid integer (< 1752 or < 0)

-- Rules
May use standard (gregorian) calendar for calculations.

-- Questions
-- Notes
Gotta refresh my memory on working with dates in JS.
Here's where range might come up useful again.

Examples-->
---- Tests for Invalid Input
t.addTest(fridayThe13ths, expected, args);
t.addTest(fridayThe13ths, undefined, '');
t.addTest(fridayThe13ths, undefined, []);
t.addTest(fridayThe13ths, undefined, {});
---- Tests for Normal Operation
t.addTest(fridayThe13ths, expected, args);
t.addTest(fridayThe13ths, 1, 1986);
t.addTest(fridayThe13ths, 3, 2015);
t.addTest(fridayThe13ths, 2, 2017);
t.addTest(fridayThe13ths, 1, 2022);

Data Structure-->

Algorithm-->
Map a range of month indexes for a single year to their date objects on the thirteen of the given year.
Map that range to the current weekday.
Filter those to the weekday int/enum for Friday and return the count of the occurrences.

✓Functions-->
[✓] isFriday(wday)
----- Given an integer representing a weekday, return true if it matches Friday's number. False otherwise.
*/

// Helpers
const FRIDAY = 5;
const range        = (len, from) => [...Array(len).keys()].map((n) => n + from);
const log          =       (val) => console.log(val);
const isFriday     =       (day) => day === FRIDAY;

// Edges
const edgeCheck = (year) => {
  if (!year || year < 1752 || typeof year !== 'number') return undefined;
  return null;
}

// Primary
function fridayThe13ths(year) {
  const isEdge = edgeCheck(year);
  if (isEdge !== null) return isEdge;

  const monthIndexes = range(12, 0);
  return monthIndexes.map((m) => new Date(year, m, 13))
                     .map((d) => d.getDay())
                     .filter(isFriday).length;
}

// Tests
t.addTest(fridayThe13ths, undefined, '');
t.addTest(fridayThe13ths, undefined, []);
t.addTest(fridayThe13ths, undefined, {});
t.addTest(fridayThe13ths, 1, 1986);
t.addTest(fridayThe13ths, 3, 2015);
t.addTest(fridayThe13ths, 2, 2017);
t.addTest(fridayThe13ths, 1, 2022);
t.runSuite();
