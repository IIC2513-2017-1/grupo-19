class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.integer :response_id
      t.integer :responded_id

      t.timestamps
    end
  end
end
