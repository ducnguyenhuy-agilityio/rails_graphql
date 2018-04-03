class AddStatusToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :status, :integer, default: 0
    add_index :bookings, :status
  end
end
