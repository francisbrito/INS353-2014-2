module StudentsHelper
    def setup_student(student)
        4.times { student.grades.build }

        student
    end
end
