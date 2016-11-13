class Category < ActiveRecord::Base
	#has_and_belongs_to_many :products
	has_many :products#, dependent: :destroy
	validates :name, presence: true, length: {minimum: 2, maximum: 20}

	def self.search(search)
      if search
        where('name LIKE ?', "%#{search}%")
      else
        all
      end
    end
end
