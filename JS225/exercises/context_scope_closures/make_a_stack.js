'use strict';

const log = (v) => console.log(v);

// [✓] private data
// [✓] uses array internally
// [✓] push - add em to end
// [✓] pop  - take em from end
// [✓] printStack - log all elements from oldest to newest

const newStack = () => {
  const _stack = [];

  return {
    push(em) {
      _stack.push(em);
    },

    pop() {
      return _stack.pop();
    },

    printStack() {
      _stack.map(log);
    },
  }
}

const hellos = newStack();
hellos.push('hola!');
hellos.push('howdy-do!');
hellos.printStack();
hellos.push('greetings, earthlings!'); // sadly, this is never seen
hellos.pop();
hellos.push('salutations, global community!');
hellos.printStack();
