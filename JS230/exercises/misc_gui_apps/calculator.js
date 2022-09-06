'use strict';

// Calculator

function uponDOM() {
  // Elements
  const    buttons = document.querySelectorAll('input[type="button"]');
  const pOperation = document.querySelector('p.operation');
  const     pEntry = document.querySelector('p.entry');

  // State
  const identity = (n) => n; // used to reset calculation function
  const state = {
    operation: [],
    entry: 0,
    calc: identity,
  };

  // Functions
  function setEntry(newValue) {
    state.entry = newValue;
    updateEntry();
  }

  function append(e) {
    const        digit = Number(e.target.value);
    const currentValue = state.entry;
    const    appendVia = currentValue < 0 ? operations['-'] : operations['+'];
    const     newValue = currentValue === 0 ? digit : appendVia(currentValue * 10, digit);
    setEntry(newValue);
  }

  function addCalculation(e) {
    const        symbol = e.target.value;
    const mathOperation = operations[symbol];
    state.calc = mathOperation.bind(uponDOM, state.calc(state.entry));
    state.operation.push(state.entry, symbol);
    resetEntry();
    pEntry.textContent = ''; // encourage entering new value
    updateOperation();
  }

  function equals() {
    const result = state.calc(state.entry);
    resetState();
    setEntry(result);
    updateWindow();
  }

  function updateWindow(forEntry=true, forOperation=true) {
    if (forOperation) pOperation.textContent = state.operation.join(' ');
    if (forEntry)     pEntry.textContent     = state.entry;
  }

  function resetState(resetEntry=true, resetOperation=true, resetCalc=true) {
    if (resetEntry)     state.entry     = 0;
    if (resetOperation) state.operation = [];
    if (resetCalc)      state.calc      = identity;
  }

  const      resetEntry = resetState.bind(this, true, false, false);
  const     updateEntry = updateWindow.bind(this, true, false);
  const  resetOperation = resetState.bind(this, false, true, false);
  const updateOperation = updateWindow.bind(this, false, true);

  // Data
  const operations = {
    '+': (a, b) => a + b,
    '-': (a, b) => a - b,
    'x': (a, b) => a * b,
    '/': (a, b) => a / b,
    '%': (a, b) => a % b,
  };

  const FUNC_REFS = {
    append: append,
    calc: addCalculation,
    opEqual: equals,
    opNeg: () => setEntry(state.entry *= -1),
    opClearEntry: () => setEntry(0),
    opClear: () => {
      resetState();
      updateWindow();
    },
  };

  // Events
  buttons.forEach((b) => b.addEventListener('click', (e) => FUNC_REFS[e.target.dataset.func](e)));
  updateWindow();
}

document.addEventListener('DOMContentLoaded', uponDOM);
