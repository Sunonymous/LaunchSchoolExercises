'use strict';

const log = (v) => console.log(v);

// Form Validation Part 2
// and Automatic Tab Forwarding

function uponDOM() {
  // Elements
  const $inputs = $('form input');
  const $form = $('form');
  // Functions
  function allValidEntries() {
    const validity = $inputs.get().map((em) => em.validity.valid);
    return validity.every((n) => !!n);
  }

  function getErrorElement(inputEm) {
    return inputEm.parentNode.querySelector('div p') || inputEm.parentNode.parentNode.querySelector('div p.error');
  }

  // given a keypress event and a regex string pattern to match against
  function filterKeys(event, pattern) {
    const regex = new RegExp(pattern);
    if (!regex.test(event.key)) {
      event.preventDefault();
      return false;
    }

    return true;
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

  function serializeData(form) {
    const URLize = (pair) => `${encodeURIComponent(pair[0])}=${encodeURIComponent(pair[1])}`;
    const formData = new FormData(form);
    const data = [...formData.entries()];
    const cardPair = ['creditCard', ''];
    const formattedData = data.map((pair) => {
      if (pair[0].includes('creditCard')) {
        cardPair[1] += pair[1];
      } else if (pair[0] === 'phone' && pair[1] === '') {
        return '';
      } else {
        return URLize(pair);
      }
    });
    formattedData.splice(5, 4, URLize(cardPair));
    return formattedData.join('&').replace('&&', '&'); // this is in case 'phone' field is empty
    // this function is fairly hacky, though its late, this is a random practice exercise, and I am tired
  }

  function displayData(data) {
    $('#formData').removeClass('hidden');
    $('#formData p').text(data);
  }

  // Events
  $('[name="fName"], [name="lName"]').keypress((e) => filterKeys(e, '[a-zA-Z\- ]+'));
  $('[name="phone"]').keypress((e) => filterKeys(e, '[0-9\-]'));
  [1, 2, 3].forEach((n) => {
    const em = $(`[name=creditCard${n}]`);
    em.keypress((e) => {
      if (filterKeys(e, '[0-9]')) {
        if (em.val().length === 3) {
          const selector = `input[name="creditCard${n + 1}"]`;
          const nextEm = document.querySelector(selector);
          setTimeout(() => nextEm.focus(), 0);
        }
      }
    });
  });
  $('[name="creditCard4"]').keypress((e) => filterKeys(e, '[0-9]'));

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

  $form.submit((e) => {
    e.preventDefault();
    const $notice = $('#notice');
    $notice.hide();

    if (allValidEntries()) {
      alert('Successful Submission! You\'re in!');
      const toSend = serializeData($form.get(0));
      displayData(toSend);
      e.target.reset();
    } else {
      const blur = new Event('blur');
      $inputs.each((i, e) => e.dispatchEvent(blur), 0);
      $notice.show();
    }
  });

  $('#formData a').click(() => {
    $('#formData').addClass('hidden');
  });
}

$(uponDOM);
