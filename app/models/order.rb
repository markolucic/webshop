class Order < ActiveRecord::Base
  belongs_to :product, dependent: :destroy
  belongs_to :variant, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
