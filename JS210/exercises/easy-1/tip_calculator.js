// Tip Calculator
// gotta love ignoring input validation (not sarcasm... sort of)

const rlSync = require('readline-sync');

const billAmount    = Number(rlSync.question('How much was your bill? '));
const tipPercentage = Number(rlSync.question('What percentage would you like to tip? '));

const tipAmount     = Number((billAmount * (tipPercentage / 100)).toFixed(2)); // WHYYYYY does toFixed return a STRING?
const totalBill     = tipAmount + billAmount;
console.log(`Your tip calculated to  $${tipAmount}.`);
console.log(`Your total bill sums to $${totalBill}.\nThanks for tipping!`);
