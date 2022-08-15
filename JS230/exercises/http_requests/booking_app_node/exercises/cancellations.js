'use strict';

const log = (v) => console.log(v);

let HOST = 'http:localhost:3000';

// Cancellation Functions

// the makeRequest function takes an object containing details about the request
// the property:
// 'method' contains the HTTP method.
// 'url' contains the url
// 'responses' contains another object, whose keys are
//   the responses' status codes and values the responses to alert
function makeRequest(requestDetails) {
  let xhr = new XMLHttpRequest();
  xhr.open(requestDetails.method, requestDetails.url);

  xhr.addEventListener('load', () => {
    alert(requestDetails.responses[String(xhr.status)]);
  });
  xhr.addEventListener('error', () => {
    alert('An error occured. Please try again.');
  });

  xhr.send(JSON.stringify(requestDetails.data));
}

function cancelSchedule(scheduleID) {
  makeRequest({
    method: 'DELETE',
    url: HOST + `/api/schedules/${scheduleID}`,
    data: {schedule_id: scheduleID},
    responses: {
      '204': 'Schedule has been cancelled successfully.',
      '403': 'Unable to cancel schedule. Schedule is already booked.',
      '404': `Unable to cancel schedule. Unknown schedule id: ${scheduleID}.`,
    },
  });
}

function cancelBooking(bookingID) {
  makeRequest({
    method: 'PUT',
    url: HOST + `/api/bookings/${bookingID}`,
    data: {booking_id: bookingID},
    responses: {
      '204': 'Booking has been cancelled successfully.',
      '404': `Unable to cancel booking. Unknown booking id: ${bookingID}`,
    },
  })
}

// throwaway function for viewing the IDs and verifying that the functions work
function showSchedules() {
  const data = fetch(HOST + '/api/schedules').then((data) => data.json()).then((json) => log(json));
}

