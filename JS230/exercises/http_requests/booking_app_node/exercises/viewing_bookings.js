'use strict';

const log = (v) => console.log(v);

const HOST = 'http://localhost:3000';

// Viewing Bookings

async function getAPIData(url) {
  const response = await fetch(url);
  const     data = await response.json();
  return data;
}

document.addEventListener('DOMContentLoaded', async (event) => {
  // Elements
  const dateUList = document.querySelector('#dateList');
  const dateItems = [];
  // Functions
  async function createBookingListFor(dateStr) {
    const bookings = await getAPIData(`/api/bookings/${dateStr}`);
    const subList = document.createElement('ul');
    subList.classList.add('hidden');
    subList.setAttribute('type', 'circle');
    for (let i = 0; i < bookings.length; i += 1) {
      const data = bookings[i];
      const booking = document.createElement('li');
      booking.textContent = data.join(' | ');
      subList.appendChild(booking);
    }
    return subList;
  }

  // Get the Dates with Bookings
  const datesRaw = await getAPIData(HOST + '/api/bookings');
  // Convert to Nodes and Store References
  datesRaw.forEach(async (d) => {
    const node = document.createElement('li');
    node.classList.add('date')
    node.textContent = d;
    // Sublist
    const bookings = await createBookingListFor(d);
    node.appendChild(bookings);
    // Event Listener
    node.addEventListener('click', (e) => {
      node.querySelector('ul').classList.toggle('hidden');
    });
    // Add finished product
    dateItems.push(node);
    dateUList.appendChild(node);
  });
});
