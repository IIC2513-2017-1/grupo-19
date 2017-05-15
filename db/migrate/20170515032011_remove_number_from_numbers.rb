class RemoveNumberFromNumbers < ActiveRecord::Migration[5.0]
  def change
    remove_column :numbers, :number, :integer
  end
end
