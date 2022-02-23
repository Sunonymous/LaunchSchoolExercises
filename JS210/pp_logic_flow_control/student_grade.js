const rlSync = require('readline-sync');

// read three lines to get student test scores
//   disregard input checking
// compute the average as follows:
//   >= 90         -- A
//   >= 70 && < 90 -- B
//   >= 50 && < 70 -- C
//   < 50          -- F

// accepting scores higher than a certain limit (eg 100) seems wonky,
//   though I guess we don't care.

const sum = (a, b) => a + b;

function isBetween(n, low, high) {
  return n >= low && n <= high;
}

function gradeToLetter(grade) {
  if (grade >= 90) {
    return 'A';
  } else if (isBetween(grade, 70, 89)) {
    return 'B';
  } else if (isBetween(grade, 50, 69)) {
    return 'C';
  } else if (grade < 50) {
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

function getGradeSeries(numberOfGrades) {
  let result = [];
  do {
    let prompt = `Enter score ${result.length + 1}: `
    result.push(getScore(prompt));
  } while (result.length < numberOfGrades);
  return result;
}

const numberOfScores = 3;
const averageScore = computeAverage(getGradeSeries(numberOfScores));
const finalGrade = gradeToLetter(averageScore);
console.log(`Based on the average of your ${numberOfScores} scores, your letter grade is "${finalGrade}".`);

// I did the further exploration as the initial problem again. is that a good sign?
