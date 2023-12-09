class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :school
      t.text :description
      t.string :location
      t.date :started_at
      t.date :ended_at

      t.timestamps
    end
  end
end
