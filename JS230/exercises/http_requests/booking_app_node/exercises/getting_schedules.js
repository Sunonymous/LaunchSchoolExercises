'use strict';

// Getting Schedules

const log = (v) => console.log(v);

function frequencies(array) {
  const results = {};
  array.forEach((n) => {
    if (results[n]) {
      results[n] += 1;
    } else {
      results[n] = 1;
    }
  });

  return results;
}

document.addEventListener('DOMContentLoaded', (event) => {
  let request = new XMLHttpRequest();
  let data;
  const results = document.getElementById('results');
  request.open('GET', 'http://localhost:3000/api/schedules/');
  request.timeout = 8000;

  request.addEventListener('load', (e) => {
    data = JSON.parse(e.target.responseText);
    if (data.length === 0) {
      results.textContent = 'All schedules are booked. Please try again some other time.';
    } else {
      const staffIDs = data.map((o) => `staff ${o.staff_id}`);
      const freqs = frequencies(staffIDs);
      const parsed = JSON.stringify(freqs);
      results.textContent = parsed;
      alert(parsed);
    }
  });

  request.addEventListener('timeout', (e) => {
    results.textContent = 'Apologies, your request could not be completed as dialed. Please hang up and try again.';
    request.abort();
  });

  request.addEventListener('loadend', (e) => {
    alert('Request completed. Hooray!');
  });

  request.send();
});
