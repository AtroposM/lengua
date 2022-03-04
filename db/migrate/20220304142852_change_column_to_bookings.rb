class ChangeColumnToBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :status
    add_column :bookings, :status, :boolean, default: true
  end
end
