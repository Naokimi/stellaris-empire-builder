class CreateGovernmentEthics < ActiveRecord::Migration[6.0]
  def change
    create_table :government_ethics do |t|
      t.references :government, null: false, foreign_key: true
      t.references :ethic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
