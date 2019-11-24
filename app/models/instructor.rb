class Instructor
    attr_reader :name
   
    

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def find_student_test(student, test_name)
        student.student_tests.find {|test|
        test.test_name == test_name
        }
    end

    def pass_student(student, test_name)
        result = find_student_test(student, test_name)

        if result
            result.test_status = "passed"
        else
            result = BoatingTest.new(student, test_name, "passed", self)
        end
        result
    end

    
    def fail_student(student, test_name)
        result = find_student_test(student, test_name)

        if result
            result.test_status = "failed"
        else
            result = BoatingTest.new(student, test_name, "failed", self)
        end
        result
    end


end
