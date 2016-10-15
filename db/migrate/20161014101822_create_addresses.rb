class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :full_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone_number
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
