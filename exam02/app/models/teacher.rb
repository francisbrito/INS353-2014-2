class Teacher < ActiveRecord::Base
    has_many :subjects

    def active_subjects
        subjects.map{|s| s if s.active}.count
    end
end
