class CreateEthics < ActiveRecord::Migration[6.0]
  def change
    create_table :ethics do |t|
      t.string :name
      t.string :icon
      t.integer :value
      t.string :effects
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
