class AddAmountToBookings < ActiveRecord::Migration[6.0]
  def change
    add_monetize :bookings, :total, currency: { present: false }
    add_column :bookings, :checkout_session_id, :string
    remove_column :bookings, :end_date
    add_column :bookings, :duration, :integer, default: 1, null: false
  end
end
