class User < ApplicationRecord
    has_secure_password
    PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}\z/

    validates :u_user_name, presence: true, uniqueness: true, length: { minimum: 8, message: "must be at least 8 characters" }
    validates :u_name, presence: true, length: { minimum: 2, message: "must be at least 2 characters" }
    validates :password, format: { with: PASSWORD_REGEX, message: "must be at least 8 characters and include one uppercase, one lowercase, one digit, and one special character" }, if: :password_required?
    has_many :student_subjects, dependent: :destroy

    def password_required?
        new_record? || !password.nil?
    end
end
