'use strict';

// Adding Staff

document.addEventListener('DOMContentLoaded', (event) => {
  const form       = document.querySelector('form');
  const nameField  = document.querySelector('[name="name"]');
  const emailField = document.querySelector('[name="email"]');

  form.addEventListener('submit', (e) => {
    e.preventDefault();

    if (nameField.value.length < 1 || emailField.value.length < 1) {
      alert('Invalid input detected. Please enter valid values for both fields.');
      return;
    } else {
      const data = new FormData(form);

      const request = new XMLHttpRequest();
      request.responseType = 'json';
      request.open('POST', form.action);

      request.addEventListener('load', (e) => {
        if (request.status === 201) {
          alert(`Staff member created successfully with id ${request.response.id}`);
          form.reset();
        } else {
          alert('Something mysterious has gone wrong. Call for help!');
        }
      });

      request.send(data);
    }
  });
});
