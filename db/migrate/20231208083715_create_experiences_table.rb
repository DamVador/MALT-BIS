class CreateExperiencesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :description
      t.string :location
      t.date :started_at
      t.date :ended_at
      t.text :tags

      t.timestamps
    end
  end
end
