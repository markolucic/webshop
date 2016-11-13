class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :variant
  belongs_to :user
end
