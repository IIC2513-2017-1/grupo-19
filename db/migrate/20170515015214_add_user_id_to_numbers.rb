class AddUserIdToNumbers < ActiveRecord::Migration[5.0]
  def change
    add_column :numbers, :user_id, :integer
  end
end
