const isSame = (array1, array2) => (array1.length === array2.length) && array1.every(function(em, idx) {
    return em === array2[idx];
});

//////////////////////////////////////////////////////////////////////////

// Finally! Tests!!!

const DEBUG = false;

exports.testSuite = (name) => {
  let tests = [];

  function makeTest(name, expected, testFunction) {
    tests.push({
      name: name,
      expected: expected,
      return: testFunction(),
      get result() {
        if (Array.isArray(this.expected)) {
          return isSame(this.expected, this.return);
        } else {
          return this.expected === this.return;
        }
      }
    });
  }

  const testAsExpected = (test) => !!test['result']; // !! just in case...
  const testWentRogue  = (test) => !(test['result']);

  function analyzeResults() {
    let s_count = tests.filter(testAsExpected).length;
    let failures = tests.filter(testWentRogue);
    let f_count  = failures.length;
    console.log(`Test results: ${s_count} successes and ${f_count} failures.`)
    if (f_count > 0) {
      console.log(`Failed tests are the following:\n`);
      failures.forEach(test => console.log(`'${test['name']}' - Expected <${test['expected']}> -- Received: <${test['return']}>`));
    }
  }

  return {
    makeTest,
    analyzeResults
  }
}

// .load index_of_substring_2.js

if (DEBUG) {
  const onePlusOne = () => 1 + 1;
  const onePlusTwo = () => 1 + 4;

  let suite = testSuite();
  suite.makeTest('test_onePlusOne', 2, onePlusOne);
  suite.makeTest('test_onePlusTwo', 3, onePlusTwo);
  suite.analyzeResults();
}
