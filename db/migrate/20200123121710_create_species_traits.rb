class CreateSpeciesTraits < ActiveRecord::Migration[6.0]
  def change
    create_table :species_traits do |t|
      t.references :species, null: false, foreign_key: true
      t.references :trait, null: false, foreign_key: true

      t.timestamps
    end
  end
end
