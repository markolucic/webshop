class Brand < ActiveRecord::Base

	has_many :products, dependent: :destroy
	validates :name, presence: true, length: {minimum: 2, maximum: 20}

	def self.search(search)
      if search
      	search = search.downcase
        where('lower(name) LIKE ?', "%#{search}%")
      else
        all
      end
    end
    
end
