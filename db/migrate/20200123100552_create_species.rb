class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :name
      t.text :bigraphy
      t.string :archetype
      t.string :portrait
      t.references :origin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
