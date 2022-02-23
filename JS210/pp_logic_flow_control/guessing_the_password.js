// gotta grab this one again
const rLSync = require('readline-sync');


// there is a secret password
const PASSWORD = 'secret squirrel';

// user is prompted for password
const PASSWORD_CHANCES = 3
let incorrectGuesses   = 0;
let hasAccess          = false;
let passwordEntry      = '';

do {
  passwordEntry = rLSync.question('Please enter your password: ');
  if (passwordEntry === PASSWORD) {
    hasAccess = true;
    break;
  } else {
    incorrectGuesses += 1;
    continue;
  }
} while (incorrectGuesses < PASSWORD_CHANCES)

// after three incorrect attempts, the program terminates
if (hasAccess) {
  console.log('You have successfully logged in.');
} else {
  console.log('You have been denied access.');
}
