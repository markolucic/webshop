class User < ActiveRecord::Base
	before_create :confirmation_token
	has_secure_password

	#valdiacija ostalih podataka (regex email), duzina passworda
	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
    validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  	#before_save :encrypt_password
    after_save :clear_password

    def clear_password
    	self.password_digest = nil
    end

    private

	def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
