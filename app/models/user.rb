class User < ActiveRecord::Base
	has_secure_password

	#attr_accessible :name, :surname, :phone, :is_admin, :is_active, :email, :password, :password_confirmation

	#valdiacija ostalih podataka (regex email), duzina passworda
	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
    validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  	#before_save :encrypt_password
    after_save :clear_password

    def clear_password
    	self.password_digest = nil
    end

end
