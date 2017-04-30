class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :number_id

      t.timestamps
    end
  end
end
