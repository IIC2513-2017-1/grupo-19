class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.string :name
      t.text :description
      t.integer :raffle_id

      t.timestamps
    end
  end
end
