class AddSenderAndReceiverAndConversationToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :sender_id, :integer
    add_foreign_key :messages, :users, column: :sender_id
    add_column :messages, :receiver_id, :integer
    add_foreign_key :messages, :users, column: :receiver_id
    add_column :messages, :conversation_id, :integer
    add_foreign_key :messages, :conversations, column: :conversation_id
  end
end
