// Leap Years Part 2

// Same as previous exercise, minus a conditional that checks on whether or not the year is 1752

const GREGORIAN_CALENDAR_BIRTHDAY = 1752;
const beforeGregorianCalendar = n => n < GREGORIAN_CALENDAR_BIRTHDAY;
const divisibleBy100          = n => n % 100 === 0;
const divisibleBy4            = n => n % 4 === 0;
const divisibleBy400          = n => n % 400 === 0;
const divisibleBy100And400    = n => divisibleBy100(n) && divisibleBy400(n);
const divisibleBy4ButNot100   = n => divisibleBy4(n) && !divisibleBy100(n);

const isLeapYear = year => {
  if (beforeGregorianCalendar(year)) {
    return !!divisibleBy4(year);
  } else {
    return !!(divisibleBy100And400(year) || divisibleBy4ButNot100(year));
  }
}

// this exercise used the same test cases, so I only altered the cases that resulted differently
console.log(!!isLeapYear(2016));      // true
console.log(!isLeapYear(2015));      // false
console.log(!isLeapYear(2100));      // false
console.log(!!isLeapYear(2400));      // true
console.log(!!isLeapYear(240000));    // true
console.log(!isLeapYear(240001));    // false
console.log(!!isLeapYear(2000));      // true
console.log(!isLeapYear(1900));      // false
console.log(!!isLeapYear(1752));      // true
console.log(!!isLeapYear(1700));      // true
console.log(!isLeapYear(1));         // false
console.log(!!isLeapYear(100));       // true
console.log(!!isLeapYear(400));       // true
