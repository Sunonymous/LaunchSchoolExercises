'use strict';

const log =    (v) => console.log(v);
const sum = (a, b) => a + b;

let invoices = {
  unpaid: [],
  paid  : [],
  add(name, amount) {
    this.unpaid.push({
      name,
      amount,
    })
  },

  totalDue() {
    return this.unpaid.reduce((acc, inv) => acc + inv.amount, 0);
  },

  totalPaid() {
    return this.paid.reduce((acc, inv) => acc + inv.amount, 0);
  },

  payInvoice(name) {
    let stillUnpaid = [];
    this.unpaid.forEach((inv) => {
      if (inv.name === name) {
        this.paid.push(inv);
      } else {
        stillUnpaid.push(inv);
      }
    });

    this.unpaid = stillUnpaid;
  },
};

let inv1 = ['Due North Development', 250];
let inv2 = ['Moonbeam Interactive', 187.50];
let inv3 = ['Slough Digital', 300];

invoices.add(...inv1);
invoices.add(...inv2);
invoices.add(...inv3);

// log(invoices.totalDue());

invoices.payInvoice('Due North Development');
invoices.payInvoice('Slough Digital');
log(invoices.totalPaid());
log(invoices.totalDue());
