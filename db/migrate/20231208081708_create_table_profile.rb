class CreateTableProfile < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :location
      t.integer :price
      t.string :experience
      t.boolean :is_remote
      t.string :category

      t.timestamps
    end
  end
end
