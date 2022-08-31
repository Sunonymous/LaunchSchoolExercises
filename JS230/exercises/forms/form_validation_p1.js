'use strict';

const log = (v) => console.log(v);

// Form Validation Parts 1 and 2
// (for the second part to run, ensure this boolean is true)
const partTwo = true;

function uponDOM() {
  // Elements
  const $inputs = $('form input');
  // Functions
  function allValidEntries() {
    const validity = $inputs.get().map((em) => em.validity.valid);
    return validity.every((n) => !!n);
  }

  function getErrorElement(inputEm) {
    return inputEm.parentNode.querySelector('div p');
  }

  // pass in the validity object
  function errorMsg(v) {
    switch (true) {
      case v.valueMissing:
        return 'This field requires an entry.';
      case v.typeMismatch:
        return 'Please provide your input in the format requested.';
      case v.patternMismatch:
        return 'Please provide your input in the format requested.';
      case v.tooLong:
        return 'This field requires less characters.';
      case v.tooShort:
        return 'This field requires more characters.';
      default:
        return 'No error message was encountered.';
    }
  }

  // Events
  $inputs.focus((e) => {
    e.target.classList.remove('invalid');
    getErrorElement(e.target).textContent = '';
  });

  $inputs.blur((e) => {
    const invalid = e.target.validationMessage;
    if (invalid) {
      e.target.classList.add('invalid');
      const validity = e.target.validity;
      const reason = errorMsg(validity);
      getErrorElement(e.target).textContent = reason;
    }
  });

  $('form').submit((e) => {
    e.preventDefault();
    const $notice = $('#notice');
    $notice.hide();

    if (allValidEntries()) {
      alert('Successful Submission! You\'re in!');
      e.target.reset();
    } else {
      const blur = jQuery.Event('blur');
      $inputs.trigger(blur);
      $notice.show();
    }
  });

  // Part 2
  if (partTwo) {
    log('Part 2!');
  }
}

$(uponDOM);
