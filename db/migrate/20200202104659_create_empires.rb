class CreateEmpires < ActiveRecord::Migration[6.0]
  def change
    create_table :empires do |t|
      t.string :name
      t.references :species, null: false, foreign_key: true
      t.references :government, null: false, foreign_key: true

      t.timestamps
    end
  end
end
