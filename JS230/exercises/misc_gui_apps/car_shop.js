'use strict';

const log = (v) => console.log(v);

// Used Car Shop
// This code was a LOT simpler... that is, until I added the functionality
// that the filter options will continually refresh as

// Data
const UNIVERSAL_OPTION = 'Any';
const NUMERIC_PROPERTIES = ['year', 'price'];

const cars = [
  { make: 'Honda', image: './car_images/honda-accord-2005.jpg', model: 'Accord', year: 2005, price: 7000 },
  { make: 'Honda', image: './car_images/honda-accord-2008.jpg', model: 'Accord', year: 2008, price: 11000 },
  { make: 'Toyota', image: './car_images/toyota-camry-2009.jpg', model: 'Camry', year: 2009, price: 12500 },
  { make: 'Toyota', image: './car_images/toyota-corrolla-2016.jpg', model: 'Corolla', year: 2016, price: 15000 },
  { make: 'Suzuki', image: './car_images/suzuki-swift-2014.jpg', model: 'Swift', year: 2014, price: 9000 },
  { make: 'Audi', image: './car_images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 25000 },
  { make: 'Audi', image: './car_images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 26000 },
];

const unique = (arr) => Array.from(new Set(arr)).sort(numsAndStrings); // cast to array for easier iteration
const uniquePropVals = (arr, prop) => unique(arr.map((o) => o[prop]));
const numsAndStrings = (a, b) => Number.isInteger(a) ? a - b : b - a; // compulsory sorting for "prettiness"

const allCarProperties = {
  make: uniquePropVals.bind(this, cars, 'make'),
  model: uniquePropVals.bind(this, cars, 'model'),
  price: uniquePropVals.bind(this, cars, 'price'),
  year: uniquePropVals.bind(this, cars, 'year'),
};

function uponDOM() {
  // Templates
  const carCardTemplate = Handlebars.compile(document.querySelector('#carCardTemplate').innerHTML);

  // Elements
  const selectEms = Array.from(document.querySelectorAll('select'));
  const   cardCol = document.querySelector('#carColumn');

  // State
  const activeFilters = {
    make: null,
    model: null,
    price: null,
    year: null,
  };
  let filteredCars = cars;

  // Functions
  function makeOption(val=UNIVERSAL_OPTION, txt=UNIVERSAL_OPTION) {
    const opt = document.createElement('option');
    opt.value = val;
    opt.innerText = txt;
    return opt;
  }

  function populateAllSelects() {
    selectEms.forEach((s) => {
      s.innerHTML = ''; // clear existing
      s.appendChild(makeOption()); // universal option
      const vals = allCarProperties[s.name]();
      vals.forEach((v) => s.appendChild(makeOption(v, v)));
    });
  }

  function populateSelect(selectEm) {
    selectEm.innerHTML = ''; // clear existing
    selectEm.appendChild(makeOption()); // universal option
    filterCars();
    const vals = uniquePropVals(filteredCars, selectEm.name);
    vals.forEach((v) => selectEm.appendChild(makeOption(v, v)));
  }

  function isInvalidSelect(selectEm) {
    const invalid = !uniquePropVals(filteredCars, selectEm.name).includes(selectEm.value);
    if (invalid) activeFilters[selectEm.name] = null;
    return invalid;
  }

  const selectToChange = (selectEm) => {
    return selectEm.value === UNIVERSAL_OPTION || isInvalidSelect(selectEm);
  }

  function filterOtherSelects(selectEm) {
    selectEms.filter((s) => s.name !== selectEm.name && selectToChange(s)).forEach(populateSelect);
  }

  const makeFilter = (prop, val) => (arr) => arr.filter((n) => n[prop] === val);

  function resetFilters() {
    activeFilters.length = 0; // clear existing
    selectEms.forEach((s) => {
      if (s.value !== 'Any') {
        const prop = s.name;
        const val = (NUMERIC_PROPERTIES.includes(prop)) ? Number(s.value) : s.value;
        activeFilters[prop] = makeFilter(prop, val);
      }
    });
    filterCars();
  }

  function filterCars() {
    filteredCars = cars;
    Object.values(activeFilters).forEach((f) => f ? filteredCars = f(filteredCars) : null);
  }

  const populateCarCards = () => cardCol.innerHTML = filteredCars.map(carCardTemplate).join('');

  // Events
  filterBtn.addEventListener('click', () => {
    resetFilters();
    populateCarCards();
  });

  resetBtn.addEventListener('click', () => {
    Object.keys(allCarProperties).forEach((p) => {
      activeFilters[p] = null;
    });
    populateAllSelects();
  });

  selectEms.forEach((s) => s.addEventListener('change', (e) => {
    const prop = e.target.name;
    let val = e.target.value;
    if (val === 'Any') {
      activeFilters[prop] = null;
    } else {
      if (NUMERIC_PROPERTIES.includes(prop)) val = Number(val);
      activeFilters[prop] = makeFilter(prop, val);
    }
    filterCars();
    filterOtherSelects(e.target);
  }));

  // First Run!
  populateAllSelects();
  populateCarCards();
}

document.addEventListener('DOMContentLoaded', uponDOM);
