class CreateGovernments < ActiveRecord::Migration[6.0]
  def change
    create_table :governments do |t|
      t.string :type
      t.string :icon
      t.text :description

      t.timestamps
    end
  end
end
