'use strict';

// Custom Delete Confirmation

// Data
let todos = [
  {id: 0, task: 'Save the World'},
  {id: 1, task: 'Buy Rash Cream'},
  {id: 2, task: 'Bury Gerbil'},
  {id: 3, task: 'Practice Soliloquies'},
];

let deleteQueue = null; // tracks which id is going to be deleted

function uponDOM() {
  // Elements
  const       todoPanel = document.querySelector('.panel');
  const confirmationBox = document.querySelector('#confirmation-box');
  const      confirmYes = document.querySelector('#confirm-delete');
  const       confirmNo = document.querySelector('#confirm-cancel');
  // Functions
  function deleteQueuedTask() {
    if (deleteQueue) {
      todos = todos.filter((t) => t.id !== Number(deleteQueue));
      confirmationBox.classList.add('is-hidden');
      document.querySelector(`label[data-id="${deleteQueue}"]`).remove();
      deleteQueue = null;
    }
  }

  function cancelDeletion() {
    deleteQueue = null;
    confirmationBox.classList.add('is-hidden');
  }

  function addTask(item) {
    const todo = document.createElement('label');
    todo.classList.add('panel-block', 'is-justify-content-space-between');
    todo.setAttribute('data-id', item.id);
    todo.innerHTML = `<input type="checkbox">${item.task}<button class="delete has-background-danger is-pulled-right"></button>`;
    todoPanel.appendChild(todo);
    todo.querySelector('button').addEventListener('click', (e) => {
      if (deleteQueue) return; // if item already queued, return
      deleteQueue = todo.dataset.id;
      confirmationBox.classList.remove('is-hidden');
    });
  }
  // Events
  todos.forEach((t) => addTask(t));
  confirmYes.addEventListener('click', deleteQueuedTask);
  confirmNo.addEventListener('click', cancelDeletion);
}

document.addEventListener('DOMContentLoaded', uponDOM);
