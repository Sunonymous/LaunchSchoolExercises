'use strict';

// the location may have to be altered within each distinct folder
const test = require('../../tester');
const t = test.makeTestSuite();

/*
Problem-->
  Description~
  -- Implement a simple stack-and-register programming language.
  -- This language is given a string as input with space separated commands.
  -- The processing itself has a stand and a register. The register stores a
  ---- single value for use in binary operations.
  -- The stack contains a series of values which may change dynamically in runtime.
  -- The stack accepts its input string and processes each command sequentially.
  IO~
  -- Input  -> String of space-separated commands.
  -- Output -> Side-effects occur when print statement are present.
               Otherwise, the only effects of the program are modifying state.
  -- Edges  -> Told to ignore invalid programs.
               (later I wrote these anyway: empty string or non-string input)
  Rules~
  -- Stack should be initialized as an empty array.
  -- Register initialized as 0.
  -- All operations are integer operations.
  -- Valid operations/commands are the following:
  -- (The description lists their ONLY functionality.)
  ---- <int>       - Place the given integer into the register.
  ---- 'PUSH'      - Push the register value onto the stack.
  ---- 'ADD'       - Register the result of adding the registered value to a popped stack value.
  ---- 'SUB'       - Register the result of subtracting a popped stack value from the registered value.
  ---- 'MULT'      - Register the result of multiplying the registered value with a popped value.
  ---- 'DIV'       - Register the result of dividing the registered value with a popped value.
  ---- 'REMAINDER' - Register the result of the integer remainder from dividing the registered value by a popped value.
  ---- 'POP'       - Register a popped stack value.
  ---- 'PRINT'     - Log the register value.
  Questions~
  -- Feels lazy to not account for broken/invalid programs. Can I go home now??
  Notes~
  -- JS is forgiving, though let's /not/ take "advantage" of implicit coercion.
  -- Because the function has side-effects, it is not convenient to test.
  ---- Let's have the function also return the registered value upon termination.
Examples-->
  -- Template
  -- Tests for Invalid Input
    -- <REDACTED> // dramatic
  -- Tests for Normal Operation
    -- 0  <= 'PRINT'         // register initialized at 0
    -- 9  <= '9'             // register receives pushed values
    -- 0  <= '9 PUSH SUB'    // test subtraction and stack
    -- 8  <= '4 PUSH add'    // test addition and case-insensitivity
    -- 64 <= '8 PUSH MULT'   // test multiplication and stack
    -- 1 <= '7 PUSH DIV'     // test division and stack
    -- 2 <= '4 PUSH 6 REMAINDER'   // test remainder and stack
    -- 3 <= '3 PUSH 6 POP'   // test popping into register from stack
    -- I also added LS tests into test cases below
Data Structure-->
  -- We'll split the commands into an array for easy processing.
  -- We can store the commands as functions in an object with the command names as keys.
  ---- Doing this I saw a lot of duplication.
Algorithm-->
  -- Neutralize the case of the tokenString by converting it to UPPERCASE.
  -- Split the tokenString on whitespace to get an array of individual commands.
  -- Reverse the tokens array to get the proper order.
  -- Until the tokens array is empty, sequentially pop and process a command.
  -- PROCESS_COMMAND
  ---- If the command matches a regular expression for an integer, place it in the register.
  ---- Otherwise, run the command at the key of itself in the TOKENS object.
*/

// Helpers
const WHITESPACE = /\s+/;
const IS_INT     = /^-?\d+$/;
const log        = (val) => console.log(val);

// Edges
const edgeCheck = (tokens) => {
  if (typeof tokens !== 'string' || tokens.length === 0) return undefined;
  return null;
}

// Primary
function minilang(tokenString) {
  const isEdge = edgeCheck(tokenString);
  if (isEdge !== null) return isEdge;

  const ERROR_EMPTY_STACK = 'Attempted to perform an operation with a null value. Ensure stack contains values!';
  const stack    = [];
  let   register = 0;

  const ops = {
    '>>': (a, b) => b,
    '+':  (a, b) => a + b,
    '-':  (a, b) => a - b,
    '*':  (a, b) => a * b,
    '/':  (a, b) => Math.floor(a / b),
    '%':  (a, b) => a % b,
  }

  const reRegister = (f) => register = f(register, stack.pop());

  const TOKENS = {
    PUSH:      () => stack.push(register),
    PRINT:     () => log(register),
    STACK:     () => log(stack),
    POP:       () => reRegister(ops['>>']),
    ADD:       () => reRegister(ops['+']),
    SUB:       () => reRegister(ops['-']),
    MULT:      () => reRegister(ops['*']),
    DIV:       () => reRegister(ops['/']),
    REMAINDER: () => reRegister(ops['%']),
  }
  const STACK_TOKENS  = ['POP', 'ADD', 'SUB', 'MULT', 'DIV', 'REMAINDER'];

  const stackEmpty    =      () => stack.length === 0;
  const validToken    = (token) => Object.keys(TOKENS).includes(token);
  const needsStackVal = (token) => STACK_TOKENS.includes(token);
  const usesNull      = (token) => needsStackVal(token) && stackEmpty();

  const processToken = (token) => {
    if (IS_INT.test(token)) {
      register = Number(token);
    } else if (validToken(token)) {
      if (usesNull(token)) throw(ERROR_EMPTY_STACK);
      TOKENS[token]();
    } else {
      throw(`Unrecognized token '${token}'. Check token string.`);
    }
  }
  
  tokenString.toUpperCase().split(WHITESPACE).forEach(processToken);

  return register;
}

// Manual Tests
// minilang('3 PUSH PUSH PUSH STACK');

// Invalid Operations
// minilang('0 PUSH POP POP');
// minilang('BURN IT DOWN');
// minilang('----4');

// Tests
t.addTest(minilang, undefined, 74);
t.addTest(minilang, undefined, '');
t.addTest(minilang, 0,  'PRINT');
t.addTest(minilang, 9,  '9');
t.addTest(minilang, 0,  '9 PUSH SUB');
t.addTest(minilang, 8,  '4 PUSH add');
t.addTest(minilang, 64, '8 PUSH mUlT');
t.addTest(minilang, 1,  '7 PUSH DIV');
t.addTest(minilang, 2,  '4 PUSH 6 REMAINDER');
t.addTest(minilang, 3,  '3 PUSH 6 pop');
t.addTest(minilang, 15, '5 PUSH 3 MULT PRINT');
t.addTest(minilang, 8,  '5 PRINT PUSH 3 PRINT ADD PRINT');
t.addTest(minilang, 5,  '5 PUSH POP PRINT');
t.addTest(minilang, 7,  '3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
t.addTest(minilang, 6,  '3 PUSH PUSH 7 DIV MULT PRINT');
t.addTest(minilang, 12, '4 PUSH PUSH 7 REMAINDER MULT PRINT');
t.addTest(minilang, 8,  '-3 PUSH 5 SUB PRINT');
t.addTest(minilang, 6,  '6 PUSH');
t.runSuite();
