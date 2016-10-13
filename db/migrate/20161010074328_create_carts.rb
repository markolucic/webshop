class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      #t.references :user, index: true
      t.integer :product_id
      t.integer :user_id
	  t.integer :quantity #koliko korisnik narucuje

      t.timestamps null: false
    end
  end
end
