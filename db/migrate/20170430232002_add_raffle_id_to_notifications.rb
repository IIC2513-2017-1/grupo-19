class AddRaffleIdToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :raffle_id, :integer
  end
end
