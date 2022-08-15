'use strict';

const log = (v) => console.log(v);

// Adding Schedules

function makeElement(type, content, props={}) {
  const elem = document.createElement(type);
  if (content.length > 0) elem.appendChild(document.createTextNode(content));

  const properties = Object.keys(props);

  for (let i = 0; i < properties.length; i += 1) {
    const prop = properties[i];
    elem.setAttribute(prop, props[prop]);
  }

  return elem;
}

const HOST = 'http://localhost:3000';

async function getAllStaff() {
  const response = await fetch(HOST + '/api/staff_members');
  const     data = await response.json();
  return data;
}

document.addEventListener('DOMContentLoaded', async (event) => {
  const addSelectorBtn = document.querySelector('.addNewSchedule');
  const submitBtn = document.querySelector('.submitSchedules');
  const formContainer = document.querySelector('.scheduleSelectors');

  const staff     = await getAllStaff();
  const staffOpts = staff.map((obj) => makeElement('option', obj.name, {value: obj.id}));

  const formTemplate  = document.querySelector('.scheduleForm');
  const staffSelect   = formTemplate.querySelector('select');
  for (let i = 0; i < staffOpts.length; i += 1) {
    staffSelect.appendChild(staffOpts[i]);
  }
  const scheduleForms = [formTemplate];

  function addForm() {
    const id = scheduleForms.length + 1; // id from number of existing forms on page
    const form = formTemplate.cloneNode(true);
    form.querySelector('legend').innerHTML = `Schedule ${id}`;
    formContainer.appendChild(form); // change schedule label
    scheduleForms.push(form);
  }

  function fieldsFilled(formEm) {
    const inputs = formEm.querySelectorAll('input');
    for (let i = 0; i < inputs.length; i += 1) {
      const msg = inputs[i].validationMessage;
      if (msg !== '') { return false; }
    }
    return true;
  }

  function clearForms() {
    for (let i = 0; i < scheduleForms.length; i += 1) {
      scheduleForms[i].reset();
    }
  }

  function submitForms() {
    // validate input
    for (let i = 0; i < scheduleForms.length; i += 1) {
      if (!fieldsFilled(scheduleForms[i])) {
        alert('Please check your inputs!');
        return false;
      }
    }

    const data = {schedules: []};

    for (let i = 0; i < scheduleForms.length; i += 1) {
      const form = scheduleForms[i];
      const schedule = {};
      schedule.staff_id = form.querySelector('select').value;
      schedule.date     = form.querySelector("[name='date']").value;
      schedule.time     = form.querySelector("[name='time']").value;
      data.schedules.push(schedule);
    }

    const xhr = new XMLHttpRequest();
    xhr.open('POST', formTemplate.action);
    xhr.setRequestHeader('Content-Type', 'application/json');

    xhr.onload = () => {
      if (xhr.status === 201) {
        alert('Schedules submitted successfully.');
        clearForms();
      } else {
        alert(`Please check your inputs.`);
      }
    }

    xhr.send(JSON.stringify(data));

  }

  addSelectorBtn.onclick = addForm;
  submitBtn.onclick = submitForms;
});
