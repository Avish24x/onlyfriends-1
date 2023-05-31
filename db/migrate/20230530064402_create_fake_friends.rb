class CreateFakeFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :fake_friends do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.text :address
      t.text :main_description
      t.decimal :price
      t.decimal :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
