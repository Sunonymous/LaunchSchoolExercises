let getName = function(prompt) {
  let rlSync = require('readline-sync');
  return rlSync.question(prompt);
}
let rlSync = require('readline-sync');
let firstName = getName("What's your first name?\n");
let lastName  = getName("What's your last name?\n");
console.log(`Good morning, ${firstName + ' ' + lastName}!`);
