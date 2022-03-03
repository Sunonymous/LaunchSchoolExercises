// Cute Angles

const MINUTES_IN_DEGREE = 60;
const SECONDS_IN_MINUTE = 60;
const modulo = (a, n) => ((a % n ) + n ) % n;

function dms(angle) {
  if (angle === 0 || angle === 360) return `${angle}˚00'00"`;
  angle = angle > 360 || angle < -360 ? modulo(angle, 360) : angle; // account for excess
  angle = angle <   0 ? 360 - Math.abs(angle) : angle; // account for negative
  const degrees = Math.floor(angle);
  const min     = (MINUTES_IN_DEGREE * (angle - degrees));
  let minutes = Math.floor(min);
  minutes = minutes < 10 ? '0' + minutes : minutes; // pad 0
  let seconds = Math.floor(SECONDS_IN_MINUTE * (min - minutes));
  seconds = seconds < 10 ? '0' + seconds : seconds; // pad 0
  return `${degrees}˚${minutes}'${seconds}"`
}

console.log('Test Results:');
// console.log(dms(30));           // 30°00'00"
// console.log(dms(76.73));        // 76°43'48"
// console.log(dms(254.6));        // 254°35'59"
// console.log(dms(93.034773));    // 93°02'05"
// console.log(dms(0));            // 0°00'00"
// console.log(dms(360));          // 360°00'00" or 0°00'00"
console.log(dms(-1));   // 359°00'00"
console.log(dms(400));  // 40°00'00"
console.log(dms(-40));  // 320°00'00"
console.log(dms(-420)); // 300°00'00"
