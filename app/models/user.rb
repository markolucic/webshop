class User < ActiveRecord::Base
	has_secure_password

	#valdiacija ostalih podataka (regex email), duzina passworda
	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
    validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
    validates :password, confirmation: true, :length => { :minimum => 5 }

end
