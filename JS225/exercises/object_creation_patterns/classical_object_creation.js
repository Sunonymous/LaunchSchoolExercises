'use strict';

const log = (v) => console.log(v);

/*
Problem-->
Implement the given diagram using a pseudo-classical approach to object creation.
Reuse the superclass's constructor in the sub-class.
*/

// first comes Person, the root of all abstractions
function Person(fName, lName, age, gender) {
  this.firstName = fName;
  this.lastName  = lName;
  this.age       = age;
  this.gender    = gender;
};

Person.prototype.fullName    = function() { return this.firstName + ' ' + this.lastName;};
Person.prototype.eat         = function() { return 'Yum yum!';};
Person.prototype.communicate = function() { return 'BlahBlAhBLaHbLaHbLAh';};
Person.prototype.sleep       = function() { return 'zzZZZZzzzZZzzzZzzzz';};

// preliminary tests
let sunny = new Person('Sunny', 'Sunshine', 29, 'Manthing');
log(`\n---${sunny.fullName()}---\n`);
log(`Sunshine is Person? ${sunny instanceof Person}`);
log(sunny.eat());
log(sunny.communicate());
log(sunny.sleep());
// the likeness is uncanny!

// MED SCHOOL

function Doctor(fName, lName, age, gender, spec) {
  Person.call(this, fName, lName, age, gender);
  this.specialization = spec;
}

Doctor.prototype             = Object.create(Person.prototype);
Doctor.prototype.constructor = Doctor;
Doctor.prototype.diagnose    = function() { return 'Indubitably. I went to "medical" school.';};

let sunnyDoc = new Doctor('Sunny', 'Fullshine', 29, 'Manlike', 'Fruit and Colors');
log(`\n---${sunnyDoc.fullName()}---\n`);
log(`Fullshine is Doctor? ${sunnyDoc instanceof Doctor}`);
log(`Doctor is Person? ${sunnyDoc instanceof Person}`);
log(sunnyDoc.eat()); // do doctors eat?
log(sunnyDoc.diagnose()); //

// REAL SCHOOL

function Professor(fName, lName, age, gender, subj) {
  Person.call(this, fName, lName, age, gender);
  this.subject = subj;
}
Professor.prototype             = Object.create(Person.prototype);
Professor.prototype.constructor = Professor;
Professor.prototype.teach       = function() { return 'Please turn your textbooks to page 42 and give me some advice on my date tonight.'; };

let monotoneSunny = new Professor('Sunny', 'Shinebright', 29, 'Mandible', 'Logistics of Imaginary Cooperation');
log(`\n---${monotoneSunny.fullName()}---\n`);
log(`Shinebright is Professor? ${monotoneSunny instanceof Professor}`);
log(`Professor is Person? ${monotoneSunny instanceof Person}`);
log(monotoneSunny.sleep()); // do professors sleep?
log(monotoneSunny.teach());
log(monotoneSunny.sleep()); // do professors sleep enough?

function Student(fName, lName, age, gender, degree) {
  Person.call(this, fName, lName, age, gender);
  this.degree = degree;
}
Student.prototype             = Object.create(Person.prototype);
Student.prototype.constructor = Student;
Student.prototype.study       = Person.prototype.sleep; // lol

let studySunny = new Student('Sunny', 'Studies', 29, 'Man-freak', 'Theoretical');
log(`\n---${studySunny.fullName()}---\n`);
log(`Studies is Student? ${studySunny instanceof Student}`);
log(`Student is Person? ${studySunny instanceof Person}`);
log(studySunny.communicate()); // do students communicate?
log(studySunny.study());

function GraduateStudent(fName, lName, age, gender, degree, gradDegree) {
  Student.call(this, fName, lName, age, gender, degree);
  this.graduateDegree = gradDegree;
}
GraduateStudent.prototype             = Object.create(Student.prototype);
GraduateStudent.prototype.constructor = GraduateStudent;
GraduateStudent.prototype.research    = function() { return 'Hmm... yes. I see... Wonderful. Still not blind.'; };

let hypotheticalSunny = new GraduateStudent('Sunny', 'Searches', 29, 'Mandarin', 'Treegree', '42');
log(`\n---${hypotheticalSunny.fullName()}---\n`);
log(`Searches is GraduateStudent? ${hypotheticalSunny instanceof GraduateStudent}`);
log(`GraduateStudent is Student? ${hypotheticalSunny instanceof Student}`);
log(`Student is Person? ${hypotheticalSunny instanceof Person}`);
log(hypotheticalSunny.fullName()); // do graduate students have full names?? these are the questions nobody asks
log(hypotheticalSunny.research());
