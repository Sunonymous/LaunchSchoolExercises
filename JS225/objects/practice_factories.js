'use strict';

const log =    (v) => console.log(v);

// 1
// The country objects all share the same functionality and data shape.
// They can be extracted to a factory for a `country` object

// 2
const makeCountry = (name, continent, visited = false) => {
  return {
    name,
    continent,
    visited: false,
    getDescription() {
      return `${this.name} is located in ${this.continent}. I have${this.visited ? '' : "n't"} visited ${name}.`;
    },

    visitCountry() {
      this.visited = true;
    }
  }
}

let chile = makeCountry('The Republic of Chile', 'South America');
let canada = makeCountry('Canada', 'North America');
let southAfrica = makeCountry('The Republic of South Africa', 'Africa');

// These values changed after a further question.
// log(chile.getDescription() === "The Republic of Chile is located in South America.");
// log(canada.getDescription() === "Canada is located in North America.");
// log(southAfrica.getDescription() === "The Republic of South Africa is located in Africa.");

log(canada.getDescription() === "Canada is located in North America. I haven't visited Canada.");
canada.visitCountry();
log(canada.getDescription() === "Canada is located in North America. I have visited Canada.");
