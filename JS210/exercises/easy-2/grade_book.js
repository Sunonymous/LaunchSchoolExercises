// Grade Book

// we already did almost this exact same exercise...
// at least my code is super re-usable!

const sum = (a, b) => a + b;

function isBetween(n, low, high) {
  return n >= low && n <= high;
}

function gradeToLetter(grade) {
  if (isBetween(grade, 90, 100)) {
    return 'A';
  } else if (isBetween(grade, 80, 89)) {
    return 'B';
  } else if (isBetween(grade, 70, 79)) {
    return 'C';
  } else if (isBetween(grade, 60, 69)) {
    return 'D';
  } else if (grade < 60) {
    return 'F';
  } else {
    return 'error';
  }
}

function getScore(prompt) {
  return parseInt(rlSync.question(prompt));
}

function computeAverage(arr) {
  return arr.reduce(sum) / arr.length;
}

const getGrade = (...scores) => gradeToLetter(computeAverage(scores));

console.log('Test Results:');
console.log(getGrade(95, 90, 93) === 'A');
console.log(getGrade(50, 50, 95) === 'D');
