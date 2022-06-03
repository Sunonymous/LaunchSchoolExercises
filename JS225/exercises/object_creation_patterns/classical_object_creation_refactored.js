'use strict';

// started via copy-paste

const log = (v) => console.log(v);

// first comes Person, the root of all abstractions
class Person {
  constructor(fName, lName, age, gender) {
    this.firstName = fName;
    this.lastName  = lName;
    this.age       = age;
    this.gender    = gender;
  }

  fullName() {
    return this.firstName + ' ' + this.lastName;
  }

  eat() {
    return 'Yum yum!';
  }

  communicate() {
    return 'BlahBlAhBLaHbLaHbLAh';
  }

  sleep() {
    return 'zzZZZZzzzZZzzzZzzzz';
  }
}

// preliminary tests
let sunny = new Person('Sunny', 'Sunshine', 29, 'Manthing');
log(`\n---${sunny.fullName()}---\n`);
log(`Sunshine is Person? ${sunny instanceof Person}`);
log(sunny.eat());
log(sunny.communicate());
log(sunny.sleep());
// the likeness is uncanny!

// MED SCHOOL

class Doctor extends Person {
  constructor(fName, lName, age, gender, spec) {
    super(fName, lName, age, gender);
    this.specialization = spec;
  }

  diagnose() {
    return 'Indubitably. I went to "medical" school.';
  }
}


let sunnyDoc = new Doctor('Sunny', 'Fullshine', 29, 'Manlike', 'Fruit and Colors');
log(`\n---${sunnyDoc.fullName()}---\n`);
log(`Fullshine is Doctor? ${sunnyDoc instanceof Doctor}`);
log(`Doctor is Person? ${sunnyDoc instanceof Person}`);
log(sunnyDoc.eat()); // do doctors eat?
log(sunnyDoc.diagnose()); //

// REAL SCHOOL

class Professor extends Person {
  constructor(fName, lName, age, gender, subj) {
    super(fName, lName, age, gender);
    this.subject = subj;
  }

  teach() {
    return 'Please turn your textbooks to page 42 and give me some advice on my date tonight.';
  }
}

let monotoneSunny = new Professor('Sunny', 'Shinebright', 29, 'Mandible', 'Logistics of Imaginary Cooperation');
log(`\n---${monotoneSunny.fullName()}---\n`);
log(`Shinebright is Professor? ${monotoneSunny instanceof Professor}`);
log(`Professor is Person? ${monotoneSunny instanceof Person}`);
log(monotoneSunny.sleep()); // do professors sleep?
log(monotoneSunny.teach());
log(monotoneSunny.sleep()); // do professors sleep enough?

class Student extends Person {
  constructor(fName, lName, age, gender, degree) {
    super(fName, lName, age, gender);
    this.degree = degree;
  }

  study() {
    return this.sleep(); // lol
  }
}

let studySunny = new Student('Sunny', 'Studies', 29, 'Man-freak', 'Theoretical');
log(`\n---${studySunny.fullName()}---\n`);
log(`Studies is Student? ${studySunny instanceof Student}`);
log(`Student is Person? ${studySunny instanceof Person}`);
log(studySunny.communicate()); // do students communicate?
log(studySunny.study());

class GraduateStudent extends Student {
  constructor(fName, lName, age, gender, degree, gradDegree) {
    super(fName, lName, age, gender, degree);
    this.graduateDegree = gradDegree;
  }

  research() {
    return 'Hmm... yes. I see... Wonderful. Still not blind.';
  }
}

let hypotheticalSunny = new GraduateStudent('Sunny', 'Searches', 29, 'Mandarin', 'Treegree', '42');
log(`\n---${hypotheticalSunny.fullName()}---\n`);
log(`Searches is GraduateStudent? ${hypotheticalSunny instanceof GraduateStudent}`);
log(`GraduateStudent is Student? ${hypotheticalSunny instanceof Student}`);
log(`Student is Person? ${hypotheticalSunny instanceof Person}`);
log(hypotheticalSunny.fullName()); // do graduate students have full names?? these are the questions nobody asks
log(hypotheticalSunny.research());
