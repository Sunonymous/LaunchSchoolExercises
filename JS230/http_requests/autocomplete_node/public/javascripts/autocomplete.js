'use strict';

import debounce from './debounce.js';

class Autocomplete {
  constructor(url, inputElement) {
    this.input = inputElement;
    this.url   = url;

    this.listUI  = null;
    this.overlay = null;

    this.visible = false;
    this.matches = [];

    this.wrapInput();
    this.createUI();

    this.valueChanged = debounce(this.valueChanged.bind(this), 300);
    this.bindEvents();

    this.reset();
  }

  wrapInput() {
    let wrapper = document.createElement('div');
    wrapper.classList.add('autocomplete-wrapper');
    this.input.parentNode.appendChild(wrapper);
    wrapper.appendChild(this.input);
  }

  createUI() {
    let listUI = document.createElement('ul');
    listUI.classList.add('autocomplete-ui');
    this.input.parentNode.appendChild(listUI);
    this.listUI = listUI;

    let overlay = document.createElement('div');
    overlay.classList.add('autocomplete-overlay');
    overlay.style.width = `${this.input.clientWidth}px`;

    this.input.parentNode.appendChild(overlay);
    this.overlay = overlay;
  }

  bindEvents() {
    this.input.addEventListener('input', this.valueChanged);
    this.input.addEventListener('keydown', this.handleKeydown.bind(this));
    this.listUI.addEventListener('mousedown', this.handleClick.bind(this));
  }

  handleClick(e) {
    this.input.value = e.target.textContent;
    this.reset();
  }

  handleKeydown(e) {
    switch(e.key) {
      case 'ArrowDown':
        e.preventDefault();
        if (this.selectedIndex === null || this.selectedIndex === this.matches.length - 1) {
          this.selectedIndex = 0;
        } else {
          this.selectedIndex += 1;
        }
        this.bestMatchIndex = null;
        this.draw();
        break;
      case 'ArrowUp':
        e.preventDefault();
        if (this.selectedIndex === null || this.selectedIndex === 0) {
          this.selectedIndex = this.matches.length - 1;
        } else {
          this.selectedIndex -= 1;
        }
        this.bestMatchIndex = null;
        this.draw();
        break;
      case 'Tab':
        if (this.bestMatchIndex !== null && this.matches.length !== 0) {
          this.input.value = this.matches[this.bestMatchIndex].name;
          e.preventDefault();
        }
        this.reset();
        break;
      case 'Enter':
        e.preventDefault();
        this.reset();
        break;
      case 'Escape':
        e.preventDefault();
        this.input.value = this.previousValue;
        this.reset();
        break;
    }
  }

  valueChanged() {
    let val = this.input.value;
    this.previousValue = val;

    if (val.length > 0) {
      this.fetchMatches(val, (matches) => {
        this.visible = true;
        this.matches = matches;
        this.bestMatchIndex = 0;
        this.selectedIndex = null;
        this.draw();
      });
    } else {
      this.reset();
    }
  }

  fetchMatches(query, cb) {
    let req = new XMLHttpRequest();

    req.addEventListener('load', () => {
      cb(req.response);
    });

    req.open('GET', `${this.url}${encodeURIComponent(query)}`);
    req.responseType = 'json';
    req.send();
  }

  draw() {
    while (this.listUI.lastChild) {
      this.listUI.removeChild(this.listUI.lastChild);
    }

    if (!this.visible) {
      this.overlay.textContent = '';
      return;
    }

    if (this.bestMatchIndex !== null && this.matches.length !== 0) {
      let selected = this.matches[this.bestMatchIndex];
      this.overlay.textContent = this.generateOverlayContent(this.input.value, selected);
    } else {
      this.overlay.textContent = '';
    }

    this.matches.forEach((match, index) => {
      let li = document.createElement('li');
      li.classList.add('autocomplete-ui-choice');

      if (index === this.selectedIndex) {
        li.classList.add('selected');
        this.input.value = match.name;
      }

      li.textContent = match.name;
      this.listUI.appendChild(li);
    });
  }

  generateOverlayContent(value, match) {
    let end = match.name.substr(value.length);
    return value + end;
  }

  reset() {
    this.visible        = false;
    this.matches        = [];
    this.bestMatchIndex = null;
    this.selectedIndex  = null;
    this.previousValue  = null;

    this.draw();
  }
}

document.addEventListener('DOMContentLoaded', () => {
  let input = document.querySelector('input');
  const autocomp = new Autocomplete('/countries?matching=', input);
});
