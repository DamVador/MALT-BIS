class AddUserIdAndProfileIdToCourses < ActiveRecord::Migration[7.0]
  def up
    add_column :courses, :user_id, :integer
    add_foreign_key :courses, :users, column: :user_id
    add_column :courses, :profile_id, :integer
    add_foreign_key :courses, :profiles, column: :profile_id
  end

  def down
    remove_column :courses, :user_id
    remove_column :courses, :profile_id
  end
end
