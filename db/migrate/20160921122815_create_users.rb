class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.boolean :is_admin, default: false
      t.string :password_digest


      t.timestamps null: false
    end
  end
end
