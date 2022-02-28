// After Midnight
// 3 AM?

// will be using the setMinutes feature, I'm thinking

function padWithZeroes(number, length) {
  let numberString = String(number);

  while (numberString.length < length) {
    numberString = `0${numberString}`;
  }

  return numberString;
}

function timeOfDay(minFromMidnight) {
  let day = new Date('1993-05-12T00:00:00');
  day.setMinutes(day.getMinutes() + minFromMidnight);
  let hours = padWithZeroes(day.getHours(), 2);
  let minutes = padWithZeroes(day.getMinutes(), 2);
  return `${hours}:${minutes}`;
}

// Part Two
function afterMidnight(timeStr) {
  let [hours, minutes] = timeStr.split(':');
  return (Number(hours) * 60) + Number(minutes);
}

function beforeMidnight(timeStr) {
  let [hours, minutes] = timeStr.split(':');
  hours   = hours   === '00' ? 23 : Number(hours);
  minutes = minutes === '00' ? 60 : Number(minutes);
  return ((23 - hours) * 60) + (60 - minutes);
}

console.log('Test Results:');
console.log(timeOfDay(0) === "00:00");
console.log(timeOfDay(-3) === "23:57");
console.log(timeOfDay(35) === "00:35");
console.log(timeOfDay(-1437) === "00:03");
console.log(timeOfDay(3000) === "02:00");
console.log(timeOfDay(800) === "13:20");
console.log(timeOfDay(-4231) === "01:29");
console.log(afterMidnight('00:00') === 0);
console.log(beforeMidnight('00:00') === 0);
console.log(afterMidnight('12:34') === 754);
console.log(beforeMidnight('12:34') === 686);
