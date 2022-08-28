'use strict';

const log = (v) => console.log(v);

// jQuery Events

// Document Ready
$(() => {
  // CharKey
  let specialKey;
  const logKey = () => log(`Key updated to ${specialKey}.`);

  // Anchor Toggle
  $('a').on('click', (e) => {
    e.preventDefault();
    $('#accordion').slideToggle();
  });

  // Form Submit Event
  $('form').submit((event) => {
    event.preventDefault();
    specialKey = $('input[name="key"]').val();
    logKey();

    $(document).off('keypress').on('keypress', (e) => {
      if (e.key !== specialKey) {
        return;
      } else {
        $('a').trigger('click');
      }
    });
  });
});
