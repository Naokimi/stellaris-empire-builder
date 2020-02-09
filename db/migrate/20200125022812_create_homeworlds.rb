class CreateHomeworlds < ActiveRecord::Migration[6.0]
  def change
    create_table :homeworlds do |t|
      t.string :name
      t.references :species, null: false, foreign_key: true
      t.string :group

      t.timestamps
    end
  end
end
