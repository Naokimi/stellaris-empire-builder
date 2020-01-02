class CreateCivics < ActiveRecord::Migration[6.0]
  def change
    create_table :civics do |t|
      t.string :name
      t.string :icon
      t.string :effects
      t.text :description

      t.timestamps
    end
  end
end
