abstract sig Subject {}
sig Student extends Subject {}
sig Professor extends Subject {}
sig Class {
	TAs: set Student,
	instructor: one Professor
}
sig Assignment {
	forClass: one Class,
	submittedBy: some Student
}
pred PolicyAllowsGrading(s: Subject, a: Assignment) {
	s in a.forClass.TAs or s in a.forClass.instructor
}
pred WhoCanGradeAssignments() {
	some s : Subject | some a: Assignment | PolicyAllowsGrading[s, a]
}

run WhoCanGradeAssignments for 3

run WhoCanGradeAssignments for 3 but 1 Assignment, 1 Class, 1 Professor, 3 Student

run {some Class} for 3
