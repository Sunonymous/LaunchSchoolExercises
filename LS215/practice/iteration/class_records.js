"use strict";

const DEBUG = false;

const EXAM_COUNT      = 4;
const EXAM_WEIGHT     = 0.65;
const EXERCISE_WEIGHT = 0.35;

// requirements
// Given a studentScores object containing nested objects of student data,
//   return a class record summary object.

// data!
let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

// functions!!
const range = (len, from) => [...Array(len).keys()].map(n => n + from);

const sum = (a, b) => a + b;

const average = (...vals) => vals.reduce(sum) / vals.length;

const weightedSum = (val1, weight1, val2, weight2) => (val1 * weight1) + (val2 * weight2);

const GRADE_LEVELS = {
  A: { min: 93, max: 100},
  B: { min: 85, max: 92 },
  C: { min: 77, max: 84 },
  D: { min: 69, max: 76 },
  E: { min: 60, max: 68 },
  F: { min:  0, max: 59 },
}

const betweenInclusive = (val, min, max) => val >= min && val <= max;

const gradeToLetter = (grade) => {
  let mark = null;
  Object.keys(GRADE_LEVELS).forEach((letterGrade) => {
    if (grade >= GRADE_LEVELS[letterGrade]['min'] && grade <= GRADE_LEVELS[letterGrade]['max']) mark = letterGrade;
  });
  return mark;
}

const formatGrade = (grade) => `${grade} (${gradeToLetter(grade)})`;

const roundToPlace = (val, decimalPlace) => {
  let multiplier = Math.pow(10, decimalPlace || 0);
  return Math.round(val * multiplier) / multiplier;
}

const calculateFinalGrade  = (scoreSet) => {
  const averageExamScore   = average(...scoreSet.exams);
  const exerciseScoreTotal = scoreSet.exercises.reduce(sum);
  const weightedGrade      = weightedSum(averageExamScore, EXAM_WEIGHT, exerciseScoreTotal, EXERCISE_WEIGHT);
  const roundedGrade       = Math.round(weightedGrade);
  return formatGrade(roundedGrade);
}

// composition!!
const makeExamStats = (examScores) => {
  return {
    average: roundToPlace(average(...examScores), 1),
    minimum: Math.min(...examScores),
    maximum: Math.max(...examScores),
  };
}

const generateClassRecordSummary = (studentsData) => {
  let classRecordSummary = {
    studentGrades: [],
  };

  let scores = Object.keys(studentsData).map((student) => studentsData[student].scores);
  scores.forEach((score) => classRecordSummary.studentGrades.push(calculateFinalGrade(score)));

  let allExamScores = [];

  // 0 is because arrays are zero-indexed
  range(EXAM_COUNT, 0).forEach((examIndex) => {
    let examScores = [];
    scores.forEach((score) => {
      examScores.push(score.exams[examIndex]);
    })
    allExamScores.push(examScores);
  })
  classRecordSummary.exams = allExamScores.map(makeExamStats);

  return classRecordSummary;
}

console.log(generateClassRecordSummary(studentScores));

// returns/logs:
// {
//   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//   exams: [
//     { average: 75.6, minimum: 50, maximum: 100 },
//     { average: 86.4, minimum: 70, maximum: 100 },
//     { average: 87.6, minimum: 60, maximum: 100 },
//     { average: 91.8, minimum: 80, maximum: 100 },
//   ],
// }



// all tests
if (DEBUG) {
  console.log('Average Testing');
  console.log(average(1, 2, 3)  === 2);
  console.log(average(5, 6, 10) === 7);

  console.log('Weighted Sum Testing');
  console.log(weightedSum(6, 0.50, 10, 0.50) === 8);

  console.log('Inclusive Between Testing');
  console.log(betweenInclusive(5, 5, 10));
  console.log(!betweenInclusive(4, 5, 10));
  console.log(betweenInclusive(10, 5, 10));
  console.log(!betweenInclusive(54, 5, 10));

  console.log('Letter Grade Testing');
  console.log(gradeToLetter(33)  === 'F');
  console.log(gradeToLetter(59)  === 'F');
  console.log(gradeToLetter(61)  === 'E');
  console.log(gradeToLetter(69)  === 'D');
  console.log(gradeToLetter(79)  === 'C');
  console.log(gradeToLetter(92)  === 'B');
  console.log(gradeToLetter(100) === 'A');
  console.log(gradeToLetter(101) === null);

  console.log('Format Grade Testing');
  console.log(formatGrade(33)  === '33 (F)');
  console.log(formatGrade(59)  === '59 (F)');
  console.log(formatGrade(61)  === '61 (E)');
  console.log(formatGrade(69)  === '69 (D)');
  console.log(formatGrade(79)  === '79 (C)');
  console.log(formatGrade(92)  === '92 (B)');
  console.log(formatGrade(100) === '100 (A)');

  console.log('Precision Rounding Testing');
  console.log(roundToPlace(54.937, 2)  === 54.94);
  console.log(roundToPlace(7.32, 1)    === 7.3);
  console.log(roundToPlace(100, 2)     === 100);
  console.log(roundToPlace(9.55555, 4) === 9.5556);
}
