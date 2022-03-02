// When Will I Retire?

const rlSync = require('readline-sync');

const untilRetirement = () => {
  const currentAge   = parseInt(rlSync.question('What is your age? '));
  const retiresAt    = parseInt(rlSync.question('At what age would you like to retire? '));
  const currentYear  = new Date().getFullYear();
  const yearDelta    = retiresAt - currentAge;
  const yearToRetire = currentYear + yearDelta;
  console.log(`\nIt's ${currentYear}. You will retire in ${yearToRetire}.`);
  console.log(`You only have ${yearDelta} more years of work to go!`);
}

untilRetirement();

// further exploration:
// node complains that this is not a function.
