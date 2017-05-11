class CreateWinners < ActiveRecord::Migration[5.0]
  def change
    create_table :winners do |t|
      t.integer :number_id
      t.integer :prize_id

      t.timestamps
    end
  end
end
