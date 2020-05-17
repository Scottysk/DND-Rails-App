class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :gender
      t.string :race
      t.string :profession
      t.string :alignment
      t.string :background
      t.integer :level
      t.string :conditions
      t.string :skills
      
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
