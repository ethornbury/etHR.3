class User < ActiveRecord::Base
    before_save { email.downcase! }
    #validates(:name, presence: true)
    validates :name,  presence: true, length: { maximum: 80 }
   # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
   has_secure_password  #facilitates a securely saved password with pword confirmation, and authenticates user
   # the above needs password digest
   validates :password, length: { minimum: 6 }
end
