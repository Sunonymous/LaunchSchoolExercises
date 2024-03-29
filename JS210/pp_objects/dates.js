// Dates!!

// 1
const today = new Date();
console.log(`today is: ${today}`);

// 2
const WEEKDAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']; // not required, yet prettier
const MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'Septempber', 'October', 'November', 'December']; // this was added later
const weekday  = today.getDay();
console.log(`today is ${WEEKDAYS[weekday]}`);

// 3
// psh. didn't read ahead
// I'm skipping this

// 4
console.log(`Today's date is ${WEEKDAYS[weekday]}, the ${today.getDate()}`);

// 5
// reusing method from previous exercise
// lol, was longer than I remember
const endsInX = x => n => String(n).endsWith(x);
const endsIn1 = endsInX('1');
const endsIn2 = endsInX('2');
const endsIn3 = endsInX('3');
const atLeastTwoDigits = n => String(n).length > 1;
const secondToLastDigitIs1 = n => {
  const cast = String(n);
  if (cast.length <= 1) return false;
  return cast[cast.length - 2] === '1';
}

const cardinalEndings = num => {
  if (endsIn1(num) && !secondToLastDigitIs1(num)) {
    return 'st';
  } else if (endsIn2(num) && !secondToLastDigitIs1(num)) {
    return 'nd';
  } else if (endsIn3(num) && !secondToLastDigitIs1(num)) {
    return 'rd';
  } else {
    return 'th';
  }
}

function dateSuffix(month, day) {
  console.log(`Today is ${WEEKDAYS[today.getDay()]}, ${MONTHS[today.getMonth()]} ${day}${cardinalEndings(day)}`);
}
dateSuffix(today.getMonth(), today.getDate());

// 6
// was retroactive change
// 7 was up there
//
// 8
function formattedDay(day) {
  return String(day) + cardinalEndings(day);
}

function formattedMonth(month) {
  return MONTHS[month];
}

function formattedDate(date = new Date()) {
  console.log(`The date is ${WEEKDAYS[date.getDay()]}, ${formattedMonth(date.getMonth())} ${formattedDay(date.getDate())}`);
}

formattedDate();

// 9
console.log(`getFullYear: ${today.getFullYear()} \n getYear: ${today.getYear()}`);
// fortunately emacs already knows that getYear is, well, wrong

// 10
console.log(`THE TIME IS ${new Date().getTime()}`);

// 11
let tomorrow = new Date(today.getTime());
tomorrow.setDate(today.getDate() + 1);
formattedDate(tomorrow);

// 12
let nextWeek = new Date(today);
console.log(`today: ${today}`);
console.log(`nextWeek: ${nextWeek}`);
console.log(`today = nextWeek? ${today === nextWeek}`); // not same object!

// 13
console.log(today.toDateString() === nextWeek.toDateString()); // equality at last
nextWeek.setDate(today.getDate() + 7);    // this is interesting because tomorrow is a new month at the time of writing
console.log(`New nextWeek: ${nextWeek}`); // still worked!!

// 14
function formatTime(date) {
  let hours = date.getHours();
  let mins  = date.getMinutes();
  hours = hours < 10 ? '0' + hours : String(hours);
  mins  = mins  < 10 ? '0' + mins  : String(mins);
  return hours + ':' + mins;
}
console.log(formatTime(today));
