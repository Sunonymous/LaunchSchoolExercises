"use strict";

const DEBUG = true;

// data!
let newReleases = [
  {
    'id': 70111470,
    'title': 'Die Hard',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/DieHard.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 654356453,
    'boxart': 'http://cdn-0.nflximg.com/images/2891/BadBoys.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
  {
    'title': 'The Chamber',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/TheChamber.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 675465,
    'title': 'Fracture',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/Fracture.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
];

// work!

// goals:
// keep only objects containing both the 'title' and 'id' properties
// return objects containing both of these properties

// steps
// filter to objects containing both keys (using separate function)
// strip them to entries, filter entries for given keys, and reconstruct them into objects

// i think this could be made pretty generic
// let's give 'er a go

// given an array of keys, return true if the object contains every property requested
const hasAllProperties = (object, properties) => {
  const objectProps = Object.keys(object);

  // just for kicks let's make this extensible; can be given a single string property or an array of properties
  if (Array.isArray(properties)) {
    let success = true;
    properties.forEach((prop) => {
      if (!objectProps.includes(prop)) {
        success = false;
      }
    })

    return success;
  } else {
    return object.hasOwnProperty(properties);
  }
}

// some quick tests
let testObj = { name: 'Dingo', occupation: 'Rabble-rouser', dob: true };
if (DEBUG) {
  console.log('hasAllProperties Tests');
  console.log(!!hasAllProperties(testObj, 'name'));
  console.log(!!hasAllProperties(testObj, ['occupation', 'dob']));
  console.log(!hasAllProperties(testObj, ['occupation', 'catchphrase', 'dob']));
  console.log(!hasAllProperties(testObj, 'favoriteIceCreamFlavor'));
}

const processReleaseData = (data) => {
  const validMovies = data.filter((movie) => hasAllProperties(movie, ['title', 'id']));
  const arrayMovies = validMovies.map((movie) => Object.entries(movie));
  const filteredMovieData = arrayMovies.map((movie) => {
    const neededKeys = movie.filter(([key, value]) => key === 'id' || key === 'title');
    return neededKeys;
  });
  return filteredMovieData.map((movie) => Object.fromEntries(movie));
}

// console.log(processReleaseData(newReleases));

// well... it works, though it is kind of messy
// let's try to generalize this too
// actually wait, I've overcomplicated this anyway.

// function should reconstruct objects to contain only requested keys
// this function assumes that the object contains all requested keys!
const skimObject = (object, keys) => {
  const newObj = {};
  keys.forEach((key) => newObj[key] = object[key]);
  return newObj;
}

const filterObjectsByProperty = (objectArray, propertyArray) => {
  const validObjects = objectArray.filter((movie) => hasAllProperties(movie, propertyArray));
  return validObjects.map((movie) => skimObject(movie, propertyArray));
}

console.log(filterObjectsByProperty(newReleases, ['title', 'id']));

// oh my god this second version is miles cleaner!
// the LS solution is very simple too, though it's tied to having truthiness of the values and not general-purpose
