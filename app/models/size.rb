class Size < ActiveRecord::Base
	has_and_belongs_to_many :products
	has_many :variants, dependent: :destroy
	validates :size,  uniqueness:  true, numericality: { only_integer: true, greater_than_or_equal_to: 28, less_than_or_equal_to: 49}

	def self.search(search)
      if search
      	search.to_i
      	if search != ""
        	where('size = ?', search)
       	else
       		all
        end
      else
        all
      end
    end

end
