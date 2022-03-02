// Invoice

// refactoring!
const sum = (a, b) => a + b;
function invoiceTotal(...amounts) {
  return amounts.reduce(sum);
}

console.log(invoiceTotal(20, 30, 40, 50) === 140);
console.log(invoiceTotal(20, 30, 40, 50, 40, 40) === 220);
