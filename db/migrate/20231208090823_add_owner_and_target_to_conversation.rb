class AddOwnerAndTargetToConversation < ActiveRecord::Migration[7.0]
  def change
    add_column :conversations, :owner_id, :integer
    add_foreign_key :conversations, :users, column: :owner_id
    add_column :conversations, :target_id, :integer
    add_foreign_key :conversations, :users, column: :target_id
  end
end
