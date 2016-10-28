class User < ActiveRecord::Base
	attr_accessor :remember_token, :activation_token, :reset_token

	has_secure_password
	before_save :downcase_email
    before_create :create_activation_digest
	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
	
    validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX, length: { maximum: 255 }
    validates :password, confirmation: true, :length => { :minimum => 5, :maximum => 30}
    validates :name, :presence => true, length: { maximum: 50 }
    validates :surname, :presence => true

    has_many :carts, dependent: :destroy
    has_many :addresses, dependent: :destroy


    # Returns the number of all products in cart
    def total_products
        self.carts.sum(:quantity)
    end

    # Returns the total price of all products in cart
    def total_price
        total = 0
        self.carts.each do |item|
            total += item.quantity * item.product.price
        end
        return total
    end

    # Returns the hash digest of the given string
    def User.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    												  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token
    def User.new_token
    	SecureRandom.urlsafe_base64
    end

    # Remembers a user in the database for use in persistent sessions
    def remember
    	self.remember_token = User.new_token
    	update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true if the given token matches the digest
    def authenticated?(attribute, token)
        digest = self.send("#{attribute}_digest")
    	return false if digest.nil? # fix kada imamo 2 browsera
    	BCrypt::Password.new(digest).is_password?(token)
    end

    # Forgets a user
    def forget
    	update_attribute(:remember_digest, nil)
    end

    # Activates an account 
    def activate 
        self.update_attribute(:activated, true)
        self.update_attribute(:activated_at, Time.zone.now)
    end

    # Sends activation email to the user
    def send_activation_email
        UserMailer.account_activation(self).deliver_now
    end

    # Sets the password reset attributes
    def create_reset_digest
        self.reset_token = User.new_token
        update_attribute(:reset_digest, User.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end

    # Sends password reset email to the user
    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end

    # Returns true if a password reset has expired
    def password_reset_expired?
        reset_sent_at < 2.hours.ago
    end

    # Sends email about order information
    def send_orders_email
        UserMailer.orders(self).deliver_now
    end


    private

        def downcase_email
            self.email = email.downcase 
        end

        # Creates and assigns the activation token and digest
        def create_activation_digest
            self.activation_token = User.new_token
            self.activation_digest = User.digest(activation_token)
        end
end
