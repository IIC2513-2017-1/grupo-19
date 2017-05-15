class DeletingEverything < ActiveRecord::Migration[5.0]
  def up
      remove_columns :messages, :subject, :sender_id, :recipient_id
      drop_table :message_responses
  end

end
