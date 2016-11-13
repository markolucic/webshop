class Brand < ActiveRecord::Base

	has_many :products, dependent: :destroy
	validates :name, presence: true, length: {minimum: 2, maximum: 20}

	def self.search(search)
      if search
        where('name LIKE ?', "%#{search}%")
      else
        all
      end
    end
    
end
