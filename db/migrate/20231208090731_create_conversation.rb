class CreateConversation < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.text :last_content
      t.timestamps
    end
  end
end
