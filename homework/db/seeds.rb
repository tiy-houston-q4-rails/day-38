cohort = Cohort.create name: "Houston Ruby Q4 2014"
student = cohort.students.create first_name: "astrid", last_name: "countee", email: "astrid@example.com"
student = cohort.students.create first_name: "chunda", last_name: "bear", email: "chunda@example.com"


puts Student.count
