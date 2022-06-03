'use strict';

const log = (v) => console.log(v);

// This exercise is a little obtuse, since it references using the work of two previous exercises which Ruby trakkers have not completed.
// Note upon completion:
// This code is very bad. There is a substantial amount of duplication, largely due in fact to very inefficient setup.
// The students desperately need a surrogate key with which to reference, so we don't have to pass objects around to identify them by reference,
//   and we don't have to have some silly search by name and grade to identify them.
// Because this is a contrived exercise, I chose to only take it so far, though I have identified and marked areas which could improve the code if refactored.
// The school and student objects don't really work very well together. In order to get it to work the way requested, I had to heavily modify both classes to play a little nicer together.
// This code is a mess. My list of improvements is by no means exhaustive. Merely a starting point.
// Should this code need to be improved, it may be better to rework the structure of the objects rather than adding functionalities upon each new requirement, as was asked of me.

// STUDENT EXERCISE

// Course Object
// [✓] name - string name of course
// [✓] code - integer code of course
// Student Object
// DATA
// [✓]    name - string student name
// [✓]    year - string student year (yup)
// [✓] courses - array of course objects
// [✓]   notes - an object with keys of course codes and the values an array of strings
// METHODS
// [✓]                 info() - logs name and year of student
// [✓]            viewNotes() - displays all notes via "<courseName>: <note1>; <note2>; etc..."
// [✓]          listCourses() - returns list of student's courses
// [✓]      addCourse(course) - appends course obj to courses
// [✓]    addNote(code, note) - at the key of code, append the string note
// [✓] updateNote(code, note) - clears all existing notes at key of code in notes and sets value to string note

// ALMOST wrote a `validYear` function before remembering that this is part one of a three-part exercise!
// still had to do this later!

// could validate against a match of existing courses and/or codes
const makeCourse = (name, code) => {
  const isString  = (s) => typeof s === 'string';
  const isNotEmpty   = (s) => s.length !== 0;
  const validData = (n, c) => (isString(n) && isNotEmpty(n)) && Number.isInteger(c);
  return {
    name,
    code,
  };
}

const createStudent = (name, year) => {
  const VALID_YEARS = ['1st', '2nd', '3rd', '4th', '5th'];
  if (!VALID_YEARS.includes(year)) {
    log('Invalid year.');
    return;
  }

  const _name = name;
  const _year = year;
  const _courses = [];
  const _notes = {};

  // student objects containing course information? oh my
  function courseNameFromCode(code) {
    for (let i = 0; i < _courses.length; i += 1) {
      if (_courses[i].code === code) return _courses[i].name;
    }
  }

  // duplication here -- could refactor out getElemFromCourse(code, em) where `em` is 'name', 'index', or 'grade'
  function courseIndexFromCode(code) {
    for (let i = 0; i < _courses.length; i += 1) {
      if (_courses[i].code === code) return i;
    }
    log(`Student ${_name} is not actively enrolled in course ${code}.`);
    return -1;
  }

  return {
    name: () => _name,
    year: () => _year,
    whoAmI: () => `${_name} is a ${_year} year student.`,
    info() {
      log(this.whoAmI());
    },
    // because courses is private, my original intention was to slice it,
    // though because they are object references I thought it may be possible to mutate them.
    // I didn't attempt it, though a simple object "clone" method could prevent this.
    courses() {
      return _courses.slice();
    },
    listCourses() {
      log(this.courses());
    },
    addCourse: (newCourse) => {
      // does not use appropriate validation mechanism
      if (!_courses.includes(newCourse)) _courses.push(newCourse);
    },
    addNote: (code, note) => {
      if (_notes[code]) {
        _notes[code].push(note);
      } else {
        _notes[code] = [note];
      }
    },
    listNotes: () => {
      Object.keys(_notes).forEach((code) => log(`${courseNameFromCode(Number(code))}: ${_notes[code].join('; ')}`));
    },
    updateNote(code, note) {
      const courseCode = String(code);
      delete _notes[courseCode];
      this.addNote(code, note);
    },
    setGrade(code, grade) {
      const index = courseIndexFromCode(code);
      if (index !== -1) {
        _courses[index].grade = grade;
      }
    }
  };

}

/* old tests for student stuff
const moon = createStudent('Moony', '88th');
const sun  = createStudent('Sunny', '4th');
sun.info();
const hardKnocks = makeCourse('Introduction to Hard Knocks', 0);
const compCourse = makeCourse('Introduction to Computers', 1337);
sun.addCourse(hardKnocks);
sun.addNote(0, 'Teacher is both ugly and yet somehow super hot');
sun.addNote(0, 'wait—can teachers read these notes??');
sun.addCourse(compCourse);
sun.addNote(1337, 'learn how to delete notes');
sun.updateNote(0, 'Teacher is respectable and nothing more need be said');
sun.updateNote(1337, 'drop class');
sun.addNote(1337, 'computers are heartless and reveal one\'s innermost secrets');
sun.listNotes();
// sun.listCourses();
*/

// SCHOOL EXERCISE

// SCHOOL OBJECT
// DATA
// [✓] students - array of student objects
// METHODS
// [✓] studentIndex(name, year) - since students don't have a surrogate key we need to reference both of these and hope to god parents are creative with names
// [✓] getGrade(name, year, courseCode) - Returns the student's grade or "In progress" if no grade is present
// [✓] addStudent(name, year) - creates a new student object and adds it to the students data array
// [✓] enrollStudent(code) - enrolls a student
// [✓] addGrade(name, year, courseCode, grade) - wow, do we really have to pass those for everything
// [✓] getReportCard(name, year) - Logs a particular student's grades for all their courses
// [✓] courseReport(courseCode) - Logs all grades of students for a particular course. Only includes students with grades. Logs `=<courseName> Grades:=`, then `<student>: <grade>` for each and then `\n---\nCourse Average: <avg>`

const makeSchool = () => {
  const _students = [];
  // let's be responsible here
  const COURSES = {
    101: 'Learning to Love Porcupines',
    102: 'Skills of Self-First Aid',
    103: 'Detoxification for Dummies',
    104: 'Political Correctness for Human-like Creatures',
  }

  const courseFromCode = (code) => {
    return {name: COURSES[code], code: code};
  }

  function studentIndex(name, year) {
    for (let i = 0; i < _students.length; i += 1) {
      const student = _students[i];
      const info = `${name} is a ${year} year student.`;
      if (student.whoAmI() === info) return i;
    }
    log(`Student ${name} in year ${year} not found in student database.`);
    return -1;
  }

  return {
    addStudent(name, year) {
      const newStudent = createStudent(name, year);
      if (newStudent) {
        _students.push(newStudent);
        return newStudent;
      }
    },
    enrollStudent(name, year, courseCode) {
      const index = studentIndex(name, year);
      if (index !== -1) {
        _students[index].addCourse(courseFromCode(courseCode));
      }
    },
    // lots of duplication in the following functions -- could refactor out `doToStudent(name, year, func)` where the func could be `getReportCard`, etc.
    // it would save a lot of code and duplication if the index-grabbing/student validation was separate from these functions
    addGrade(name, year, courseCode, grade) {
      const index = studentIndex(name, year);
      if (index !== -1) {
        _students[index].setGrade(courseCode, grade);
      }
    },
    getGrade(name, year, courseCode) {
      const studentIdx = studentIndex(name, year);
      if (studentIdx !== -1) {
        const courses = _students[studentIdx].courses();
        for (let i = 0; i < courses.length; i += 1) {
          if (courses[i].code === courseCode) {
            return courses[i].grade || 'In progress';
          }
        }
        log(`Student ${name} is not actively enrolled in course ${courseCode}.`);
      }
    },
    getReportCard(name, year) {
      const studentIdx = studentIndex(name, year);
      if (studentIdx !== -1) {
        const courses = _students[studentIdx].courses();
        courses.filter((c) => c.grade).forEach((course) => {
          log(`${course.name}: ${course.grade}`);
        });
      }
    },
    studentCourseCodes(student) {
      const courses = student.courses();
      return courses.map((c) => c.code);
    },
    courseReport(courseCode) {
      let totalGrades = 0;
      let         sum = 0;
      log(`=${COURSES[courseCode]} Grades=`);
      const enrolledStudents = _students.filter((s) => this.studentCourseCodes(s).includes(courseCode));
      if (enrolledStudents.length === 0) return undefined;
      enrolledStudents.forEach((s) => {
        const name = s.name();
        const year = s.year();
        const grade = this.getGrade(name, year, courseCode);
        if (grade) {
          totalGrades += 1;
          sum += grade;
          log(`${name}: ${grade}`);
        }
      });
      log(`---\nCourse Average: ${sum / totalGrades}`);
    },
  }
}


const school = makeSchool();
school.addStudent('Geronimo', '3rd');
school.addStudent('Phillistine', '2nd');
school.addStudent('Jiminy', '4th');
school.enrollStudent('Phillistine', '2nd', 104);
school.enrollStudent('Jiminy', '4th', 104);
school.enrollStudent('Geronimo', '3rd', 104);
school.enrollStudent('Geronimo', '3rd', 102);
school.addGrade('Geronimo', '3rd', 104, 94);
school.addGrade('Geronimo', '3rd', 102, 97);
school.addGrade('Phillistine', '2nd', 104, 67);
school.addGrade('Jiminy', '4th', 104, 88);
// log(school.getGrade('Geronimo', '3rd', 104));
// school.getReportCard('Geronimo', '3rd');
school.courseReport(104);
