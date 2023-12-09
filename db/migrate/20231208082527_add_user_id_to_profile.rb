class AddUserIdToProfile < ActiveRecord::Migration[7.0]
  def up
    add_column :profiles, :user_id, :integer
    add_foreign_key :profiles, :users, column: :user_id
  end

  def down
    remove_column :profiles, :user_id
  end
end
