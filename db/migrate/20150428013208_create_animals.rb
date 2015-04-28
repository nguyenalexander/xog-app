class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.text :desc
      t.string :species

      t.timestamps null: false
    end
  end
end
