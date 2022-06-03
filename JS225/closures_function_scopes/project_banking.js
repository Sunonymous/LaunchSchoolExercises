'use strict';
const log = (v) => console.log(v);

const onlyPositive = (v) => v < 0 ? 0 : v;
const transactionRecord = (action, amt) => {
  return {type: action, amount: amt};
}

// 4 question: should illicit or failed transactions be included in the history?
// these objects could also have (newBalance property)

const makeBank = () => {
  const accounts = [];
  let nextAccountID = 100;

  return {
    openAccount() {
      const newAcct = {id: nextAccountID += 1, ...makeAccount()}
      accounts.push(newAcct);
      return newAcct;
    },
    transfer(fromAcct, toAcct, amt) {
      // mostly ignoring failing cases for this exercise... i guess!
      // fails if: no account, insufficient funds, etc.
      const fromIdx = accounts.indexOf(fromAcct);
      const toIdx   = accounts.indexOf(toAcct);
      if ([fromIdx, toIdx].includes(-1)) return 'Account not found!';

      accounts[fromIdx].withdraw(amt);
      accounts[toIdx].deposit(amt);
    }
  };
}

// 1, and eventually 5 and 9
const makeAccount = () => {
  let balance = 0;
  const transactions = [];

  return {
    number() {
      return this.id;
    },
    balance() {
      log(balance);
    },
    // 4
    transactions() {
      return this.transactions;
    },
    // 2
    deposit(amt) {
      transactions.push(transactionRecord('deposit', amt));
      balance += amt;
      return balance;
    },
    // 3
    withdraw(amt) {
      transactions.push(transactionRecord('withdrawal', amt));
      balance = onlyPositive(balance - amt);
      return balance;
    },
  };
}

const bank = makeBank();
bank.openAccount();
const source = bank.openAccount();
const destin = bank.openAccount();
source.deposit(555);
bank.transfer(source, destin, 55);
source.balance();
destin.balance();
// log(bank.accounts);

// const account = makeAccount();
// log(account.deposit(5));
// log(account.withdraw(75));
// log(account.transactions);
