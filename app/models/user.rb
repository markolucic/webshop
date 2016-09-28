class User < ActiveRecord::Base
	has_secure_password
	before_save {self.email = email.downcase }

	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
	
    validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX, length: { maximum: 255 }
    validates :password, confirmation: true, :length => { :minimum => 5, :maximum => 30}
    validates :name, :presence => true, length: { maximum: 50 }
    validates :surname, :presence => true
end
