class AddUsersAndOwnersToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_column :favorites, :owner_id, :integer
    add_foreign_key :favorites, :users, column: :owner_id
    add_column :favorites, :user_id, :integer
    add_foreign_key :favorites, :users, column: :user_id
  end
end
