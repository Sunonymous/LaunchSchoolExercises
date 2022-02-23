// How Big is the Room?

const rlSync = require('readline-sync');

const FEET_IN_METER  = 10.7639;
const METERS_IN_FOOT = 0.092903;

function metersToFeet(m) {
  return (m * FEET_IN_METER).toFixed(2);
}

function feetToMeters(f) {
  return (f * METERS_IN_FOOT).toFixed(2);
}

// surprisingly, this worked without casting to number, though... let's be explicit (yet not racy)
function calculateRoomArea() {
  const length = Number(rlSync.question('Enter the room\'s length in meters:\n'));
  const width  = Number(rlSync.question('Enter the room\'s width in meters:\n'));
  const areaInMeters = length * width;
  console.log(`The area of the room is ${areaInMeters} square meters, which is ${metersToFeet(areaInMeters)} square feet.`);
}

// some helpers needed
const units = {
  m: 'meters',
  f: 'feet',
}

const functions = {
  m: metersToFeet,
  f: feetToMeters,
}

function calculateRoomAreaV2() {
  let unitResponse = rlSync.question('Would you like to calculate the area in meters or feet? (m/f)\n(Please note that I will do both anyway.)\n');
  if (!['m', 'f'].includes(unitResponse)) {
    console.log('Invalid response. Defaulting to meters.');
    unitResponse = 'm';
  }
  const secondaryUnit = unitResponse === 'm' ? 'f' : 'm';
  const length   = Number(rlSync.question(`Enter the room's length in ${units[unitResponse]}:\n`));
  const width    = Number(rlSync.question(`Enter the room's width in ${units[unitResponse]}:\n`));
  const roomArea = length * width;
  console.log(`The area of the room is ${roomArea} square meters, which is ${functions[unitResponse](roomArea)} square ${units[secondaryUnit]}.`);
}

calculateRoomAreaV2();
