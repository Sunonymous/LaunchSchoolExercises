'use strict';

// Selection Filters
// no more inline JS

const classifications = {
  Vertebrate:     ['Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrich'],
  'Warm-blooded': ['Bear', 'Whale', 'Ostrich'],
  'Cold-blooded': ['Salmon', 'Turtle'],
  'Mammal':       ['Bear', 'Whale'],
  'Bird':         ['Ostrich'],
}

const animals = ['Bear', 'Ostrich', 'Salmon', 'Turtle', 'Whale'];
const animalClasses = Object.fromEntries(animals.map((a) => [a, []]));

animals.forEach((a) => {
  Object.keys(classifications).forEach((c) => {
    if (classifications[c].includes(a)) animalClasses[a].push(c);
  });
});

function disableOptions(opsToDisable) {
  opsToDisable.forEach((o) => document.querySelector(`[value=${o}]`).disabled = true);
}

document.addEventListener('DOMContentLoaded', () => {
  const formClassifications = document.querySelector('#animal-classifications');
  const         formAnimals = document.querySelector('#animals');
  const         clearButton = document.getElementById('clear');

  function resetForm() {
    Array.from(document.querySelectorAll('option')).forEach((o) => o.disabled = false);
  }

  formClassifications.addEventListener('change', (e) => {
    resetForm();
    const classification = formClassifications.value;
    const toHide = Object.keys(animalClasses).filter((a) => !animalClasses[a].includes(classification));
    disableOptions([...toHide, 'Animals']);
  });

  formAnimals.addEventListener('change', (e) => {
    resetForm();
    const animal = formAnimals.value;
    const toHide = Object.keys(classifications).filter((c) => !classifications[c].includes(animal));
    disableOptions([...toHide, 'Classifications']);
  });
});

// The behavior here is very close to what is requested, though unexact.
// There are several options which I was unaware were possible, as evidenced by the solution.
