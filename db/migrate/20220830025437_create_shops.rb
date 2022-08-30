class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.references :user
      t.text :description
      t.string :avatar, default: "https://img.freepik.com/premium-vector/simple-online-shop-logo-concept_257056-364.jpg"
      t.timestamps
    end
  end
end
