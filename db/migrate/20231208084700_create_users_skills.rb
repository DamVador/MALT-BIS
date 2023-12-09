class CreateUsersSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :users_skills do |t|
      t.timestamps
    end
  end
end
