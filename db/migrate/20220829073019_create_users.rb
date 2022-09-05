class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar, default: "user.png"
      t.string :phone
      t.string :address
      t.integer :role, default: 1
      t.string :password_digest
      t.timestamps
    end
  end
end
