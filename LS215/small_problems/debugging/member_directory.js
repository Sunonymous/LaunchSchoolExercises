'use strict';

const memberDirectory = {
  'Jane Doe': '323-8293',
  'Margaret Asbury': '989-1111',
  'Callum Beech': '533-9090',
  'Juanita Eastman': '424-1919',
};

// I think \w includes numbers and also hyphens... or was it apostrophes?
// Anyway, letters only, right? Here you go. That will be $5.
function isValidName(name) {
  return (/^[A-Za-z]+ [A-Za-z]+$/).test(name);
}
// Ha! It was the underscore. I remembered (partially) wrong.

function isValidPhone(phone) {
  return (/^\d{3}-\d{4}$/).test(phone);
}

function validMemberInfo(name, phone) {
  return isValidName(name) && isValidPhone(phone);
}

function addMember(name, phone) {
  if (validMemberInfo(name, phone)) {
    memberDirectory[name] = phone;
  } else {
    console.log('Invalid member information.');
  }
}

addMember('Laura Carlisle', '444-2223');
addMember('Rachel Garcia', '232-1191');
addMember('Earl 5mith', '331-9191');
addMember('Earl Smith', '331-9191');

console.log(memberDirectory);
