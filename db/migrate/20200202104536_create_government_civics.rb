class CreateGovernmentCivics < ActiveRecord::Migration[6.0]
  def change
    create_table :government_civics do |t|
      t.references :government, null: false, foreign_key: true
      t.references :civic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
