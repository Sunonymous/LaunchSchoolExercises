'use strict';

// Stopwatch

function uponDOM() {
  // Elements
  const    hoursEm = document.querySelector('#hours');
  const  minutesEm = document.querySelector('#minutes');
  const  secondsEm = document.querySelector('#seconds');
  const cSecondsEm = document.querySelector('#centiseconds');
  const startStopBtn = document.querySelector('#startStop');
  const     resetBtn = document.querySelector('#reset');

  // Data
  const timeUnits = ['centiseconds', 'seconds', 'minutes', 'hours'];
  const clock = {
    hours: 0,
    minutes: 0,
    seconds: 0,
    centiseconds: 0,
    hoursLimit: 99,
    minutesLimit: 60,
    secondsLimit: 60,
    centisecondsLimit: 100,
  };

  // State
  let intervalID;

  // Functions
  const    tooMuchTime = () => clock[hours] >= 100;
  const        padZero = (n) => n < 10 ? '0' + n : n;
  const resetStopwatch = () => timeUnits.forEach((u) => clock[u] = 0);

  function updateDisplay() {
    hoursEm.textContent    = padZero(clock.hours);
    minutesEm.textContent  = padZero(clock.minutes);
    secondsEm.textContent  = padZero(clock.seconds);
    cSecondsEm.textContent = padZero(clock.centiseconds);
  }

  function stopTimer() {
    clearInterval(intervalID);
    intervalID = null;
    startStopBtn.textContent = 'Start';
  }

  function incrementTime() {
    clock.centiseconds += 1;
    if (tooMuchTime()) {
      alert('You win!');
      resetStopwatch();
    }
    timeUnits.forEach((u, i) => {
      const max = `${u}Limit`;
      if (clock[u] >= clock[max]) {
        clock[timeUnits[i + 1]] += 1;
        clock[u] = 0;
      }
    });
    updateDisplay();
  }

  // Events
  startStopBtn.addEventListener('click', (e) => {
    if (intervalID) {
      stopTimer();
    } else {
      intervalID = setInterval(incrementTime, 10);
      startStopBtn.textContent = 'Stop';
    }
  });

  resetBtn.addEventListener('click', (e) => {
    if (intervalID) stopTimer();
    intervalID = null; // por aquello!
    resetStopwatch();
    updateDisplay();
  });
}

document.addEventListener('DOMContentLoaded', uponDOM);
