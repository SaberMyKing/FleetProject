class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|

      t.boolean :enabled, default: true, null: false
      t.string :name, null: false, limit: 20
      t.string :mobile, null: false, limit: 20
      t.integer :fleet_id, null: false, limit: 4
      t.string :id_card, null: false, limit: 20
      t.timestamps null: false
    end
  end
end
