class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :gender
      t.string :race
      t.string :profession
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
