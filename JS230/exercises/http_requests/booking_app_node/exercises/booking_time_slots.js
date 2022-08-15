'use strict';

const log = (v) => console.log(v);

const HOST = 'http://localhost:3000';

// Booking Time Slots
async function getAPIData(url) {
  const response = await fetch(url);
  const     data = await response.json();
  return data;
}

document.addEventListener('DOMContentLoaded', async (event) => {
  // Elements
  const bookingForm = document.querySelector('#bookScheduleForm');
  const studentForm = document.querySelector('#addStudentForm');
  const studentDiv  = document.querySelector('#addStudentDiv');
  const scheduleSelect = document.querySelector('#scheduleSelect');

  // Data
  const rawStaff = await getAPIData(HOST + '/api/staff_members');
  const staffIDToName = Object.fromEntries(rawStaff.map((s) => {
    return [s.id, s.name];
  }));

  // Functions
  function clearSchedules() {
    for (let i = scheduleSelect.options.length - 1; i >= 0; i -= 1) {
      scheduleSelect.remove(i);
    }
  }

  async function populateSchedules() {
    // Get Data
    const rawSchedules = await getAPIData(HOST + '/api/schedules');

    if (rawSchedules.length === 0) { // no schedules available
      const option = document.createElement('option');
      option.textContent = 'No schedules are available at the moment. Please try again some other time.';
      option.value       = -1;
      scheduleSelect.disabled = true;
      scheduleSelect.appendChild(option)
      // didn't actually test this above part, though in theory it works! #prodev
    } else {                         // schedules available
      // Transform Data
      const unbookedSchedules = rawSchedules.filter((s) => s.student_email === null);
      const formattedSchedules = unbookedSchedules.map((s) => {
        return {
          display: `${staffIDToName[s.staff_id]} | ${s.date} | ${s.time}`,
          value: s.id,
        };
      });

      // Populate List
      formattedSchedules.forEach((o) => {
        const option = document.createElement('option');
        option.textContent = o.display;
        option.value = o.value;
        scheduleSelect.appendChild(option);
      });
    }
  }

  populateSchedules();

  // Submit Schedule Booking Request
  bookingForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const data = {
      id: scheduleSelect.value,
      student_email: bookingForm.querySelector("[type='email']").value,
    }

    let xhr = new XMLHttpRequest();
    xhr.open('POST', HOST + '/api/bookings');
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.addEventListener('load', () => {
      if (xhr.status === 204) {
        alert('Schedule booked successfully.');
        bookingForm.reset();
        studentForm.reset();
        studentDiv.classList.add('hidden');
        clearSchedules();
        populateSchedules();
      } else if (xhr.status === 404 && xhr.responseText.includes('booking_sequence')) {
        // student needs created
        const bookingSequence = xhr.responseText.match(/\d+/)[0];
        studentDiv.classList.remove('hidden');
        studentForm.querySelector('[type="email"]').value = data.student_email;
        studentForm.querySelector('[name="booking_seq"]').value = bookingSequence;
      } else {
        alert(xhr.responseText);
      }
    });

    xhr.send(JSON.stringify(data));
  });

  studentForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const data = {
      email: studentForm.querySelector('[type="email"]').value,
      name: studentForm.querySelector('[name="name"]'),
      booking_sequence: studentForm.querySelector('[name="booking_seq"]').value,
    }

    let xhr = new XMLHttpRequest();
    xhr.open('POST', HOST + '/api/students');
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.addEventListener('load', () => {
      if (xhr.status === 201) {
        alert('Student created successfully.');
        bookingForm.dispatchEvent(new Event('submit'));
      } else {
        alert('Failed to create student. Please check your inputs.');
      }
    });

    xhr.send(JSON.stringify(data));
  });
});
