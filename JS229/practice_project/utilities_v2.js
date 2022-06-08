'use strict';

const log = (v) => console.log(v);

// Utility Function Library
// "Scoreunder".js

// ✓Functions to Define
// ARRAY
// [✓] first - return the first element in array
//   [✓] empty array?
//   [✓] non-array?
// [✓] last  - return the last element in array
//   [✓] empty array?
//   [✓] non-array?
// [✓] without - return a new array without the given value passed to it
//   [✓] empty array?
//   [✓] non-array?
// [✓] range - when given one number, creates an array from 0 to n - 1, with two numbers the range is from n1 to n2 - 1
//   [✓] empty array?
//   [✓] non-array?
// [✓] lastIndexOf - returns the last index of the supplied value
//   [✓] empty array?
//   [✓] non-array?
// [✓] sample - with no argument returns a single random value from array, with an argument n, returns a new array of distinct n elements from array
//   [✓] empty array?
//   [✓] non-array?
// OBJECTS
// [✓] findWhere - return the first object with properties matching the supplied object, or undefined without a match
//   [✓] takes array! should Check each item for object identity
//   [✓] empty object? The desired behavior for this is unclear. Right now it just returns the first object in the array.
//   [✓] non-object?
// [✓] where - return an array of all objects with properties matching the supplied object
//   [✓] takes array! should Check each item for object identity
//   [✓] empty object? The desired behavior for this is unclear. Right now it matches every object.
//   [✓] non-object?
// [✓] pluck - return an array of values from the supplied key from a collection of objects
//   [✓] takes array! should Check each item for object identity
//   [✓] empty object?
//   [✓] non-object?
// I know I could use the built-in Object methods for these next two, though we'll have some fun with it.
// [✓] keys - return an array of keys from a given object
//   [✓] empty object?
//   [✓] non-object?
// [✓] values - return an array of values from a given object
//   [✓] empty object?
//   [✓] non-object?
// [✓] extend - given two+ objects, merges properties/values from the last object recursively into the first
//   [✓] empty object?
//   [✓] non-object?
// [✓] pick - returns a new object containing the properties passed to the function (if existing) from the original
//   [✓] empty object?
//   [✓] non-object?
// [✓] omit - returns a new object containing all of the properties from the original, minus any properties passed to the function
//   [✓] empty object?
//   [✓] non-object?
// [✓] has - returns true/false based on whether the given property exists on the given object
//   [✓] empty object?
//   [✓] non-object?
//   [✓] multiple properties?

// Commonality Between Operations
// Input Check - throw error if not given the appropriate type
//   Some functions should return null if input is empty, others an empty array.
//   Receiving a non-array object should throw an error. Catch 'em early.
// OBJECTS
// Operations (as could be performed on entries)
// These four functions will have custom logic.
//
// These two should have similar logic. Can write a `match` function for findWhere and use it as a filter for where.
//   findWhere - non-new filter
//   where     - non-new filter
//
//   extend    - recursive merge
//   has       - boolean check
// Whereas these five can be a little more organized.
//   pluck     - map
//   keys      - map
//   values    - map
//   pick      - filter
//   omit      - negative filter

(function() {
  const _ = function(input) {
    // used in each array/object function to filter improper input
    function validateType(expected) {
      const type  = typeof input;
      let matches = null;
      switch (expected) {
        case 'array':
          matches = Array.isArray(input);
          break;
        case 'object':
          matches = typeof input === 'object';
          if (input === null) matches = false; // this bug is very frustrating
          break;
        default:
          throw 'Function _().validateType() given unknown type to check against.';
      }
      if (!matches) throw `Expected type ${expected} and received ${typeof input}.`;
      return true;
    }

    // used for shorthand in methods which mutate (and shouldn't)
    const cp = (obj) => Array.isArray(obj) ? [...obj] : {...obj};
    const randomIndex = (arr) => Math.floor(Math.random() * arr.length);

    // this mutates! should be used with cp in other functions
    function removeRandomElement(arr) {
      const idx = randomIndex(arr);
      const em  = arr[idx];
      arr.splice(idx, 1);
      return em;
    }

    const arrayFuncs = {
      first: function() {
        validateType('array');
        return input.length > 0 ? input[0] : null;
      },
      last: function() {
        validateType('array');
        return input.length > 0 ? input[input.length - 1] : null;
      },
      without: function(...xs) {
        validateType('array');
        return cp(input).filter((em) => !xs.includes(em));
      },
      lastIndexOf: function(em) {
        validateType('array');
        const revIdx = cp(input).reverse().findIndex((e) => e === em);
        return revIdx === -1 ? revIdx : (input.length - 1) - revIdx;
      },
      sample: function(count = 1) {
        validateType('array');
        if (input.length === 0) return null;
        if (count === 1) return input[randomIndex(input)];

        const source = cp(input);
        const result = [];
        while (count > 0 && source.length > 0) {
          result.push(removeRandomElement(source));
          count -= 1;
        }
        return result;
      },
    }

    function constructFromObj(obj, via, func, returnObj = true) {
      const entr = Object.entries(obj);
      let   exit;

      if (via === 'filter') {
        exit = entr.filter(func);
      } else if (via === 'map') {
        exit = entr.map(func);
      } else {
        throw `Object reconstruction attempted with unknown VIA ${via}.`;
      }

      return returnObj ? Object.fromEntries(exit) : exit;
    }

    function allElementsOfType(funcName, expectedType) {
      input.forEach((o) => {
        if (typeof o !== expectedType) {
          throw `Cannot complete function ${funcName} with non-${expectedType} ${o}!`;
        }
      });
      return true; // just in case!
    }

    const matchObj = (testObj, queryObj) => Object.keys(queryObj).every((k) => queryObj[k] === testObj[k]);
    const mergeObj = (to, from) => Object.keys(from).forEach((p) => to[p] = from[p]);

    const objFuncs = {
      has: function(...ps) {
        validateType('object');
        return ps.every((p) => Object.hasOwn(input, p));
      },
      keys: function() {
        validateType('object');
        return constructFromObj(input, 'map', ([k, v]) => k, false);
      },
      values: function() {
        validateType('object');
        return constructFromObj(input, 'map', ([k, v]) => v, false);
      },
      pick: function(...ps) {
        validateType('object');
        return constructFromObj(input, 'filter', ([k, v]) => ps.includes(k));
      },
      omit: function(...ps) {
        validateType('object');
        return constructFromObj(input, 'filter', ([k, v]) => !ps.includes(k));
      },
      pluck: function(p) {
        validateType('array');
        allElementsOfType('pluck', 'object');
        const objsWithP = input.filter((o) => o[p] !== undefined);
        return objsWithP.map((o) => o[p]);
      },
      findWhere: function(q) {
        validateType('array');
        allElementsOfType('findWhere', 'object');
        return input.find((o) => matchObj(o, q));
      },
      where: function(q) {
        validateType('array');
        allElementsOfType('where', 'object');
        return input.filter((o) => matchObj(o, q));
      },
    }

    const typeFuncs = {
      isElement:  (o) => _.isElement.call(allFunctions, o),
      isArray:    (o) => _.isArray.call(allFunctions, o),
      isObject:   (o) => _.isObject.call(allFunctions, o),
      isFunction: (o) => _.isFunction.call(allFunctions, o),
      isBoolean:  (o) => _.isBoolean.call(allFunctions, o),
      isString:   (o) => _.isString.call(allFunctions, o),
      isNumber:   (o) => _.isNumber.call(allFunctions, o),
    }

    const allFunctions = {...arrayFuncs, ...objFuncs, ...typeFuncs};
    return allFunctions;
  };

  function typeMatch(val, expected) {
    const constructor = expected[0].toUpperCase() + expected.slice(1);
    return (!!val && typeof val === expected) ||
      (toString.call(val) === `[object ${constructor}]`);
  }

  // this function is ugly because they want it ugly
  _.range = function(...args) { // args /must/ be ascending in value!
    if (args.length === 1) {
      return [...Array(args[0]).keys()]; // from 0 to n - 1
    } else {
      return [...Array(args[1] - args[0]).keys()].map((n) => n + args[0]); // from n1 to n2 - 1
    }
  };

  _.extend = function(...os) {
    if (os.length === 0) throw `Extend given no objects to extend!`;
    if (os.length === 1) return os[0];
    if (!os.every((o) => typeof o === 'object')) throw `Cannot extend objects with non-objects!`;
    for (let i = os.length - 1; i > 0; i -= 1) {
      Object.keys(os[i]).forEach((p) => os[0][p] = os[i][p]);
    }
    return os[0];
  }

  _.isElement  = (obj) => obj && obj.nodeType === 1;
  _.isArray    = (val) => Array.isArray(val);
  _.isObject   = (val) => typeMatch(val, 'object') || typeMatch(val, 'function');
  _.isString   = (val) => typeMatch(val, 'string');
  _.isFunction = (val) => typeMatch(val, 'function');
  _.isNumber   = (val) => typeMatch(val, 'number');
  _.isBoolean  = (val) => typeMatch(val, 'boolean');

  window._ = _;
})();
