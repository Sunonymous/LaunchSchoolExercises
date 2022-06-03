'use strict';

const log = (v) => console.log(v);

// Walkthrough: Object Methods (Type Along With the Bouncing Black Code Bars!)

let me = {
  mononymous: true,
  onlyName  : 'Sunny',
  prefix    : 'that',
}

// me = {};
// me.onlyName = 'Sunny';
// me.prefix   = 'that';

function fullName(person) {
  let names = [];
  if (person.mononymous) {
    if (person.prefix) names.push(person.prefix);
    names.push(person.onlyName);
  } else {
    names.push(person.firstName, person.lastName);
  }

  console.log(names.join(' '));
}

let friend = {
  firstName  : 'Scooby',
  lastName   : 'Doo',
};

let mother = {
  firstName: 'Omma',
  lastName : 'Venusian',
}

let father = {
  firstName: 'Daddo',
  lastName : 'Martian',
}

// fullName(mother);
// fullName(father);
// console.log('|\nv');
// fullName(me);
// console.log('?');
// fullName(friend);

let people = [];

people.push(me);
people.push(friend);
people.push(mother);
people.push(father);

const rollCall = (peoples) => peoples.forEach(fullName);

// rollCall(people);

let community = {
  ERRORS: {
    invalid: 'Invalid person... (no offense)!',
  },

  inhabitants: [me, friend, mother, father],
  fullName(person) {
    let names = [];
    if (person.mononymous) {
      names.push(person.prefix, person.onlyName);
    } else {
      names.push(person.firstName, person.lastName);
    }

    console.log(names.join(' '));
  },

  rollCall() {
    return this.inhabitants.forEach(fullName);
  },

  add(person) {
    if (!this.isValidPerson(person)) return ERRORS[invalid];
    return this.inhabitants.push(person);
  },

  get(person) {
    if (!this.isValidPerson(person)) return ERRORS[invalid];
    return this.inhabitants[this.getIndex(person)];
  },

  update(person) {
    if (!this.isValidPerson(person)) return ERRORS[invalid];
    let idx = this.getIndex(person);
    return idx === -1 ? this.add(person) : this.inhabitants[idx] = person;
  },

  getIndex(person) {
    let idx;
    this.inhabitants.forEach((p, i) => {
      if (p.firstName === person.firstName &&
          p.lastName  === person.lastName) {
        idx = i;
      }
    })
    return idx ? idx : -1;
  },

  isValidPerson(person) {
    return allOfType([person.firstName, person.lastName], 'string');
  },

  remove(person) {
    if (!this.isValidPerson(person)) return ERRORS[invalid];
    let idx = this.getIndex(person);
    return idx === -1 ? 'Person not found in community.' : this.inhabitants.splice(idx, 1);
  }
}

const allOfType = (coll, type) => coll.every((v) => typeof v === type);

log(community.remove({firstName: 'Jimbo', lastName: 'Fishwall'}));
community.getIndex(friend);
log(community.remove({firstName: 'Omma', lastName: 'Venusian'}));
community.getIndex(friend);
