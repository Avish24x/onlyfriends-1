class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :booking_start
      t.datetime :booking_end
      t.decimal :total_price
      t.references :user, null: false, foreign_key: true
      t.references :fake_friend, null: false, foreign_key: true

      t.timestamps
    end
  end
end
