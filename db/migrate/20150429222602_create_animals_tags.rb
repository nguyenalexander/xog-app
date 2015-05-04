class CreateAnimalsTags < ActiveRecord::Migration
  def change
    create_table :animals_tags do |t|
      t.references :animal, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
