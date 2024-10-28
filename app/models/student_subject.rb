class StudentSubject < ApplicationRecord
    belongs_to :user
    validates :s_name, presence: true
    validates :s_student_name, presence: true
    validates :s_mark, presence: true
end