class CreateBookings < ActiveRecord::Migration[6.0]
  def change
     create_table 'bookings' do |t|
      t.integer 'mentor_id', null: false
      t.integer 'student_id', null: false
      t.timestamps null: false
    end
    add_index :bookings, :mentor_id
    add_index :bookings, :student_id
    add_index :bookings, [:mentor_id, :student_id], unique: true
  end
end
