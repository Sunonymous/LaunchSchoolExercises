'use strict';

// JavaScript Guessing Game

document.addEventListener('DOMContentLoaded', () => {
  // Elements
  const form      = document.querySelector('form');
  const guessBox  = document.getElementById('guess');
  const newGame   = document.querySelector('a');
  const messager  = document.querySelector('p');
  const submitter = document.getElementById('submitter');

  // State
  let answer;
  let guessCount;

  // Functions
  const resetGame = () => {
    answer     = Math.floor(Math.random() * 100) + 1;
    guessCount = 0;
    guessBox.disabled  = false;
    submitter.disabled = false;
    guessBox.style = 'box-shadow: 7px 7px 2px 1px teal;';
    messager.textContent = 'Guess a number between 1 and 100!';
  }

  // Bootup
  resetGame();

  // Events
  newGame.addEventListener('click', resetGame);

  form.addEventListener('submit', (e) => {
    e.preventDefault();
    const guess = parseInt(guessBox.value);
    guessBox.value = '';

    if (isNaN(guess)) {
      messager.textContent = 'Uh... that\'s not a number. How about a real guess next time?';
      return;
    }

    guessCount += 1;
    let message;

    if (guess > answer) {
      message = 'Nope! My number is lower!';
    } else if (guess < answer) {
      message = 'Nope! My number is higher!'
    } else {
      message = `You got it in ${guessCount} guesses! My number was ${answer}!`;
      guessBox.disabled  = true;
      submitter.disabled = true;
      guessBox.style = 'box-shadow: 7px 7px 2px 1px gray;';
    }

    messager.textContent = message;
  });
});
