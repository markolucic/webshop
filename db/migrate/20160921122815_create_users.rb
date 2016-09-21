class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.boolean :is_admin
      t.boolean :email_confirmed
      t.string :confirm_token
      t.string :password_digest


      t.timestamps null: false
    end
  end
end
