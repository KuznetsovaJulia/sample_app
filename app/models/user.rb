class User < ApplicationRecord
    before_save { self.email = email.downcase }
    VALID_NAME_SURNAME_REGEX =/\A\S+\b\z/i
    validates :name, presence: true, length: { maximum: 50 },
              format: { with:  VALID_NAME_SURNAME_REGEX }
    validates :surname, presence: true, length: { maximum: 50 },
              format: { with:  VALID_NAME_SURNAME_REGEX }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
    has_secure_password

    FORBIDDEN_USERNAMES = %w{дура дебил}
    validate :name_is_allowed
    private
    def name_is_allowed
        if FORBIDDEN_USERNAMES.any?{|badname| name.include?(badname)}
            errors.add(:name,"has been restricted from use.")
        end
    end
end
