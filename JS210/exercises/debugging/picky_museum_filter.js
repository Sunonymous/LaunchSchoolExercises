/**
function wantToVisit(museum, city) {
  return museum.includes('Computer')
      || museum.includes('Science')
      || ((
        museum.includes('Modern')
        && museum.includes('Art')
          && museum.includes('Andy Warhol'))
          || city === 'Amsterdam');
}
*/
// played with it for a bit, then decided it was not clearly written

// let's write out all that original logic in word form
// the function is passed two parameters, the name of the museum and the city containing it
// IF
//   museum includes the word computer OR science
// AND
// NOT
//   museum includes both 'Modern' and 'Art' and 'Andy Warhol'
//   OR
//   city is Amsterdam

// rather than change that logic, let's just rewrite it

const containsComputerOrScience = (name) => name.includes('Computer') || name.includes('Science');
const hasTheAndy = (name) => name.includes('Andy Warhol');
const containsModernArt = (name) => name.includes('Modern') && name.includes('Art');

function wantToVisit(museum, city) {
  return containsComputerOrScience(museum)
    || (containsModernArt(museum) && (hasTheAndy(museum) || city === 'Amsterdam'));
}

// Tests (should all print 'true')

console.log(wantToVisit('Computer Games Museum', 'Berlin') === true);
console.log(wantToVisit('National Museum of Nature and Science', 'Tokyo') === true);
console.log(wantToVisit('Museum of Modern Art', 'New York') === false);
console.log(wantToVisit('El Paso Museum of Archaeology', 'El Paso') === false);
console.log(wantToVisit('NEMO Science Museum', 'Amsterdam') === true);
console.log(wantToVisit('National Museum of Modern Art', 'Paris') === false);
console.log(wantToVisit('Andy Warhol Museum of Modern Art', 'Medzilaborce') === true);
console.log(wantToVisit('Moco: Modern Contemporary Art', 'Amsterdam') === true);
console.log(wantToVisit('Van Gogh Museum', 'Amsterdam') === false);
console.log(wantToVisit('Andy Warhol Museum', 'Melbourne') === false);
