class AddUserIdAndSkillIdToUsersKills < ActiveRecord::Migration[7.0]
  def change
    add_column :users_skills, :user_id, :integer
    add_foreign_key :users_skills, :users, column: :user_id
    add_column :users_skills, :skill_id, :integer
    add_foreign_key :users_skills, :skills, column: :skill_id
  end
end
