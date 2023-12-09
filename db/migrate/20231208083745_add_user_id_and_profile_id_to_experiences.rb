class AddUserIdAndProfileIdToExperiences < ActiveRecord::Migration[7.0]
  def up
    add_column :experiences, :user_id, :integer
    add_foreign_key :experiences, :users, column: :user_id
    add_column :experiences, :profile_id, :integer
    add_foreign_key :experiences, :profiles, column: :profile_id
  end

  def down
    remove_column :experiences, :user_id
    remove_column :experiences, :profile_id
  end
end
