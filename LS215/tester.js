'use strict';

/* A mini testing function to quickly move through tests for challenge problems. */

const log         = (x) => console.log(x);

// does not work for nested arrays
const arraysEqual = (arr1, arr2) => {
  // this first case catches if the function did not return an array, but was supposed to
  if (Array.isArray(arr1) && !Array.isArray(arr2)) return false;
  if (arr1.length !== arr2.length) return false;

  arr1 = arr1.slice().sort();
  arr2 = arr2.slice().sort();
  for (let i = 0; i < arr1.length; i += 1) {
    if (arr1[i] !== arr2[i]) return false;
  }

  return true;
}

const objsEqual = (obj1, obj2) => {
  if (typeof obj1 === "object" && typeof obj2 !== "object") return false;

  const keys1 = Object.keys(obj1);
  const keys2 = Object.keys(obj2);

  if (keys1.length !== keys2.length) return false;

  const mismatchFound = false;
  keys1.forEach((key) => {
    const val1 = obj1[key];
    const val2 = obj2[key];

    if (Array.isArray(val1)) {
      if (!arraysEqual(val1, val2)) mismatchFound = true;
    } else if (typeof obj1[key] === 'object') {
      if (!objsEqual(val1, val2)) mismatchFound = true;
    } else {
      if (val1 !== val2) mismatchFound = true;
    }
  });

  return !mismatchFound;
}

const format = (val) => {
  if (typeof val === 'string') {
    return `'${val}'`;
  } else if (Array.isArray(val)) {
    return `[${val.join(', ')}]`;
  } else {
    return val;
  }
}

exports.makeTestSuite = () => {
  const passString    = '\x1b[32mPASSED\x1b[0m -- ';
  const failString    = '\x1b[31mFAILED\x1b[0m -- ';
  const suiteBarrier  = '++++++++++++++++++++++';
  const testSeparator = '~~~~~~~~~~~~~~~~~~~~~~';
  let successCount    = 0;
  let failureCount    = 0;
  let totalTests      = 0;

  // each value is a nested array of [expectedReturnValue, [args]]
  const tests = {};
  // actual function objects are held here and referenced by name as key
  const funcs = {};

  // lot of duplication here. could extract a funcBetweenLog function or something
  // but I've wasted enough time on this
  function runSuite() {
    log(suiteBarrier);
    log('BEGIN TESTS');
    Object.keys(tests).forEach((funcName) => {
      log(testSeparator);
      log(`Function ${funcName}:`);
      tests[funcName].forEach((vals) => runTest(funcs[funcName], vals[0], vals[1]));
      log(testSeparator);
    });
    log('END TESTS');
    log(suiteBarrier);
    runReport();
  }

  function addTest(func, expected, ...vals) {
    const name = func.name;
    funcs[name] = func;
    tests[name] = tests[name] || [];
    tests[name].push([expected, vals]);
    totalTests += 1;
  }

  function runTest(func, expected, vals) {
    const returnVal = func(...vals);
    const signature = `${func.name}(${vals.map(format).join(', ')}) => ${format(expected)}`;
    const success   = passString + `${signature}`;
    const failure   = failString + `${signature} (returned ${format(returnVal)})`;
    let result      = null;

    if (Array.isArray(expected)) {
      result = arraysEqual(expected, returnVal);
    } else {
      result = returnVal === expected;
    }

    if (result) {
      successCount += 1;
      result = success;
    } else {
      failureCount += 1;
      result = failure;
    }
    log(result);
  }

  function resetStats() {
    successCount = 0;
    failureCount = 0;
  }

  function runReport() {
    log(`Test Suite Complete -- Out of ${totalTests}, there were ${successCount} successful test(s) and ${failureCount} failed test(s).`);
    resetStats();
  }

  return {
    addTest,
    runSuite,
  };
}

const increment = (n) => n + 1;

// usage
// const t = makeTestSuite();
// t.addTest(increment, 1, 1);
// t.addTest(increment, 1, 0);
// t.runSuite();
