class CreateRaffles < ActiveRecord::Migration[5.0]
  def change
    create_table :raffles do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.datetime :final_date
      t.integer :collected_money
      t.integer :user_id
      t.integer :raffle_category_id

      t.timestamps
    end
  end
end
