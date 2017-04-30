class CreateMessageResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :message_responses do |t|
      t.integer :message_responded_id
      t.integer :message_response_id

      t.timestamps
    end
  end
end
