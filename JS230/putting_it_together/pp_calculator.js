'use strict';

// Arithmetic Calculator

function uponDOM() {
  // Elements
  const $op1 = $('[name="operand1"]');
  const $op2 = $('[name="operand2"]');
  const $operator = $('#operator');
  const $result = $('#result');
  const OPERATIONS = {
     '+': (a, b) => a + b,
     '-': (a, b) => a - b,
     '*': (a, b) => a * b,
     '/': (a, b) => a / b,
     '%': (a, b) => a % b,
    '**': (a, b) => a ** b,
  }
  // Functions
  function calculate() {
    const op1 = Number($op1.val());
    const op2 = Number($op2.val());
    const operation = OPERATIONS[$operator.val()];
    $result.text(operation(op1, op2));
  }
  function clear() {
    [$op1, $op2].forEach((em) => em.val(''));
    $result.text('0');
  }
  // Events
  $('#calculate').click(calculate);
  $('.clear').click(clear);
}

$(uponDOM);
