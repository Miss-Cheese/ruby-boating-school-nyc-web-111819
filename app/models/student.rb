class Student
    attr_reader :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_student(name)
        @@all.find {|student|
        student.first_name == name
        }
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def student_tests
        BoatingTest.all.select {|test|
        test.student == self
        }
    end

    def number_of_student_tests
        student_tests.length
    end

    def passed_tests
        student_tests.select {|test|
        test.test_status == "passed"
        }
    end

    def number_of_passed_tests
        passed_tests.length
    end

    def grade_percentage
        (number_of_passed_tests/number_of_student_tests.to_f) * 100
    end

end
