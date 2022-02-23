let rlSync = require('readline-sync');
let startingAge = parseInt(Number(rlSync.question('How old are you currently?\n')));
agesImpending = [10, 20, 30, 40];
agesImpending.forEach(ageAddition => console.log(`In ${ageAddition} years, you will be ${startingAge + ageAddition} years old.`));
