class CreateOrigins < ActiveRecord::Migration[6.0]
  def change
    create_table :origins do |t|
      t.string :name
      t.string :image
      t.text :description
      t.text :effects

      t.timestamps
    end
  end
end
