let rlSync = require('readline-sync');
let firstName = rlSync.question("What's your first name?\n");
let lastName  = rlSync.question("What's your last name?\n");
console.log(`Good morning, ${firstName + ' ' + lastName}!`);
