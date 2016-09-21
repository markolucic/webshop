class User < ActiveRecord::Base
	has_secure_password

	attr_accessor :name, :surname, :phone, :is_admin, :is_active, :email, :password, :password_confirmation

	#valdiacija ostalih podataka (regex email), duzina passworda
	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
    validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  

end
