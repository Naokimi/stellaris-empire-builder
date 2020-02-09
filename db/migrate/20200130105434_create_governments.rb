class CreateGovernments < ActiveRecord::Migration[6.0]
  def change
    create_table :governments do |t|
      t.string :group
      t.string :icon
      t.text :description

      t.timestamps
    end
  end
end
