class CreateTraits < ActiveRecord::Migration[6.0]
  def change
    create_table :traits do |t|
      t.string :name
      t.string :icon
      t.integer :value
      t.string :effects
      t.text :description
      t.string :category
      t.string :type

      t.timestamps
    end
  end
end
