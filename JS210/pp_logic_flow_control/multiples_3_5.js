// Multiples of 3 and 5

let divisibleByThree = n => n % 3 === 0;
let divisibleByFive  = n => n % 5 === 0;
let divisibleByThreeAndFive = n => divisibleByThree(n) && divisibleByFive(n);
let divisibleByThreeOrFive  = n => divisibleByThree(n) || divisibleByFive(n);

// functions're here; where's the logic??

function multiplesOfThreeAndFive() {
  for (let i = 0; i <= 100; i++) {
    if (divisibleByThreeAndFive(i)) {
      console.log(`${i}!`);
    } else if (divisibleByThreeOrFive(i)) {
      console.log(`${i}`); // cast to string because node formats numbers differently
    }
  }
}

const multiplesOfThreeAndFiveUpto = (start, end) => {
  for (let i = start; i <= end; i++) {
    let both = divisibleByThreeAndFive(i) ? '!' : '';
    if (divisibleByThreeOrFive(i)) console.log(i + both);
  }
}

// multiplesOfThreeAndFive();
multiplesOfThreeAndFiveUpto(12, 30);
