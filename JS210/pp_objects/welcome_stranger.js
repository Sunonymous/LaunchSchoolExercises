// Welcome, Stranger!

const addPeriodToInitial = name => name.length === 1 ? name + '.' : name;
function fullName(nameArray) {
  let formattedNames = nameArray.map(addPeriodToInitial);
  return formattedNames.join(' ');
}

function greetings(names, jobObj) {
  return `Hello, ${fullName(names)}! Nice to have a ${jobObj.title} ${jobObj.occupation} around.`;
}

console.log('Test Results');
console.log(fullName(['Bootius', 'T', 'Maximus']) === 'Bootius T. Maximus');
console.log(fullName(['Klem', 'Mlek', 'Entine'])  === 'Klem Mlek Entine'  );
console.log(greetings(['Sunny', 'Alphabet', 'Supermojo'], { title: 'General', occupation: 'Ne\'erdowell' }) === 'Hello, Sunny Alphabet Supermojo! Nice to have a General Ne\'erdowell around.');
console.log(greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) === 'Hello, John Q. Doe! Nice to have a Master Plumber around.');
