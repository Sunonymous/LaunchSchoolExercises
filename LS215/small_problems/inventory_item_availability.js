"use strict";

// imports
const { transactionsFor } = require('./inventory_item_transactions');

// data
const transactionRecords = [ { id: 101, movement: 'in',  quantity:  5 },
                       { id: 105, movement: 'in',  quantity: 10 },
                       { id: 102, movement: 'out', quantity: 17 },
                       { id: 101, movement: 'in',  quantity: 12 },
                       { id: 103, movement: 'out', quantity: 15 },
                       { id: 102, movement: 'out', quantity: 15 },
                       { id: 105, movement: 'in',  quantity: 25 },
                       { id: 101, movement: 'out', quantity: 18 },
                       { id: 102, movement: 'in',  quantity: 22 },
                       { id: 103, movement: 'out', quantity: 15 }, ];

// functions
const sum = (a, b) => a + b;
const invertQuantity = (transactions) => transactions.forEach((obj) => {
  if (obj.movement === 'out') return obj.quantity *= -1
});

const isItemAvailable = (id, db) => {
  invertQuantity(db);
  return db.map((transaction) => transaction.quantity).reduce(sum) > 0;
}



// tests
console.log('Test Results:');
console.log(!isItemAvailable(101, transactionRecords));     // false
console.log(!!isItemAvailable(105, transactionRecords));     // true
