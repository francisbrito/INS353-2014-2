class Student < ActiveRecord::Base
    has_many :grades
    accepts_nested_attributes_for :grades   

    def average_grade_score
        if grades.length == 0
            0
        else
            scores = grades.map {|g| g.score}

            scores.reduce {|p, n| (p + n) / scores.length}
        end
    end
end
