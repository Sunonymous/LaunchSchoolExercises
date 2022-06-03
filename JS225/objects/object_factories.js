'use strict';

const log =    (v) => console.log(v);

const makeCar = (acceleration, brakeRate) => {
  return {
    speed: 0,
    rate : acceleration,
    brakeRate,
    accelerate() {
      this.speed += this.rate;
    },

    brake() {
      let result = this.speed - this.brakeRate;
      this.speed = result < 0 ? 0 : result;
    }
  }
}

let sedan     = makeCar(8, 6);
let coupe     = makeCar(12, 10);
let hatchback = makeCar(9, 7);

sedan.accelerate();
coupe.accelerate();
log(sedan);
log(coupe);
coupe.brake();
coupe.brake();
log(coupe);
