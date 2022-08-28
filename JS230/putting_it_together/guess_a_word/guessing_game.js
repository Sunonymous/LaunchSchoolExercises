'use strict';

// Guessing Game!

const log = (v) => console.info(v);
const err = (v) => console.error(v);
const DEBUG = false;

// mutating function!
const sample = (arr) => {
  if (arr.length === 0) return undefined;

  const idx = Math.floor(Math.random() * arr.length);
  const elem = arr[idx];
  arr.splice(idx, 1);
  return elem;
}

const LOWER_ALPHA = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
const WORDBANK = function() {
  return {
    free: ['grapefruit', 'citronella', 'dinosaur', 'raindrop', 'wonderful'],
    used: [],
    random() {
      const word = sample(this.free);
      this.used.push(word);
      return word;
    },
    status() {
      const free = this.free.length;
      const used = this.used.length;
      log(`Out of ${free + used} words -- ${free} are available and ${used} have been used.`);
    },
    reset() {
      while (this.used.length > 0) {
        this.free.push(this.used.pop());
      }
      if (DEBUG) log('Reset Complete.');
    },
  }
}()

const randomWord = () => WORDBANK.random();

class GuessingGame {
  constructor() {
    this.secretWord = randomWord();
    this.elements     = this.makeBindings();
    if (DEBUG) log(`DEBUG - The word is ${this.secretWord}`);

    if (!this.secretWord) {
      this.setMessage('Sorry, there are no more words left!');
      return {gameOver: true};
    } else {
      this.wrongGuesses = 0;
      this.guesses      = [];
      this.revealed     = 0;
      this.makeSpaces();
      this.freeze = false;
    }
    this.setMessage('Welcome to the game! You must guess the hidden word without dropping all your apples!');
  }

  makeBindings() {
    const message = document.querySelector('#message');
    const guesses = document.querySelector('#guesses > p');
    const letters = document.querySelector('#spaces');
    const  apples = document.querySelector('#apples');
    const  replay = document.querySelector('#replay');
    return {
      message,
      guesses,
      letters,
      apples,
      replay,
    }
  }

  guess(letter) {
    const spans = document.querySelectorAll('span');
    let hit = false;
    for (let i = 0; i < spans.length; i += 1) {
      if (this.secretWord[i] === letter) {
        hit = true;
        this.revealed += 1;
        spans[i].textContent = letter;
      }
    }
    return hit;
  }

  processTurn(letter) {
    this.guesses.push(letter);
    const success = this.guess(letter);
    this.elements.guesses.textContent += ` ${this.guesses[this.guesses.length - 1]}`;
    if (success) {
      this.revealed === this.secretWord.length ? this.win() : null;
    } else {
      this.wrongGuesses += 1;
      this.elements.apples.classList.add(`guess${this.wrongGuesses}`);
      this.wrongGuesses >= GuessingGame.MAX_WRONG ? this.lose() : null;
    }
  }

  setMessage(text) {
    this.elements.message.textContent = text;
  }

  makeSpaces() {
    const spacesDiv = document.querySelector('#spaces');
    for (let i = 0; i < this.secretWord.length; i += 1) {
      const space = document.createElement('span');
      spacesDiv.appendChild(space);
    }
  }

  win() {
    this.setMessage(`Congratulations! You guessed the word in ${this.guesses.length} turns!`);
    document.body.classList.add('win');
    this.elements.replay.classList.remove('hidden');
    this.freeze = true;
  }

  lose() {
    this.setMessage('Sorry; you failed the game! Try again next time.');
    document.body.classList.add('lose');
    this.elements.replay.classList.remove('hidden');
    this.freeze = true;
  }
}
GuessingGame.MAX_WRONG = 6;

document.addEventListener('DOMContentLoaded', () => {
  let game = new GuessingGame();

  function handleKey(e) {
    const key = e.key.toLowerCase();
    // These conditions mean the game is over, or that the key is invalid
    if (!game.secretWord || game.freeze || !LOWER_ALPHA.includes(key) || game.guesses.includes(key)) {
      return;
    } else {
      game.processTurn(key);
    }
  }

  function resetDOM() {
    document.body.classList.remove('win', 'lose');
    const spans = document.querySelectorAll('span');
    for (let i = 0; i < spans.length; i += 1) {
      spans[i].remove();
    }
    game.elements.guesses.textContent = '';
    game.elements.apples.classList.remove('guess1', 'guess2', 'guess3', 'guess4', 'guess5', 'guess6');
    game.elements.replay.classList.add('hidden');
  }

  document.addEventListener('keyup', handleKey);

  document.querySelector('#replay').addEventListener('click', (e) => {
    e.preventDefault();
    resetDOM();
    game = new GuessingGame();
  });
});
