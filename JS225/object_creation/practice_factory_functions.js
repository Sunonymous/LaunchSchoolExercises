'use strict';

const log = (v) => console.log(v);

// 1
// As stated about ten seconds ago on the last page, all objects created via factory functions each have a copy of all their methods,
// and it can be difficult to determine the "type" of any particular object created by them.

// 2
function makeObj() {
  return {
    propA: 10,
    propB: 20,
  };
}

// 3
const    DEF_PHONE_INVOICE = 3000;
const DEF_INTERNET_INVOICE = 5500;

let createInvoice = (services = {}) => {
  return {
    phone:       services.phone || DEF_PHONE_INVOICE,
    internet: services.internet || DEF_INTERNET_INVOICE,
    total() {
      return this.phone + this.internet;
    },
  }
};

// worked as desired!
// log(createInvoice({phone: 5, internet: 10}).total());

function invoiceTotal(invoices) {
  let total = 0;
  let i;

  for (i = 0; i < invoices.length; i += 1) {
    total += invoices[i].total();
  }

  return total;
}

let invoices = [];
invoices.push(createInvoice());
invoices.push(createInvoice({
  internet: 6500,
}));

invoices.push(createInvoice({
  phone: 2000,
}));

invoices.push(createInvoice({
  phone: 1000,
  internet: 4500,
}));

console.log(invoiceTotal(invoices));             // => 31000

// 4
const copyValIfPresent = (o1, o2, p) => {
  if (o1.hasOwnProperty(p)) {
    o2[p] = o1[p];
    return true;
  }
  return null;
};

const createPayment = (services = {}) => {
  const payment = {};
  ['internet', 'phone', 'amount'].forEach((prop) => copyValIfPresent(services, payment, prop));
  payment.total = function() {
    return payment.hasOwnProperty('amount') ? payment.amount : (payment.internet || 0) + (payment.phone || 0);
  };
  return payment;
}

function paymentTotal(payments) {
  let total = 0;
  let i;

  for (i = 0; i < payments.length; i += 1) {
    total += payments[i].total();
  }

  return total;
}

let payments = [];
payments.push(createPayment());
payments.push(createPayment({
  internet: 6500,
}));

payments.push(createPayment({
  phone: 2000,
}));

payments.push(createPayment({
  phone: 1000,
  internet: 4500,
}));

payments.push(createPayment({
  amount: 10000,
}));

console.log(paymentTotal(payments));      // => 24000

// 5
createInvoice = (services = {}) => {
  return {
    phone:       services.phone || DEF_PHONE_INVOICE,
    internet: services.internet || DEF_INTERNET_INVOICE,
    addPayment(p) {
      if (p.total() > this.amountDue()) {
        log('Illegitimate payment. Cannot accept more than owed.');
        return false;
      }
      let toPay = p.total();
      while (toPay > 0) {
        if (this.phone > 0) {
          this.phone--;
          toPay--;
          continue;
        }
        if (this.internet > 0) {
          this.internet--;
          toPay--;
        }
      }
      return true;
    },
    addPayments(ps) {
      ps.forEach((p) => this.addPayment(p));
    },
    amountDue() {
      return this.phone + this.internet;
    },
  }
};

let invoice = createInvoice({
  phone: 1200,
  internet: 4000,
});

let payment1 = createPayment({
  amount: 2000,
});

let payment2 = createPayment({
  phone: 1000,
  internet: 1200,
});

let payment3 = createPayment({
  phone: 1000,
});

invoice.addPayment(payment1);
invoice.addPayments([payment2, payment3]);
log(invoice.amountDue());       // this should return 0

// oh... interesting. I totally misunderstood this problem--that is, misunderstood the direction requested
// still, the code works. \shrug/
