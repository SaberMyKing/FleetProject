class CreateFleets < ActiveRecord::Migration
  def change
    create_table :fleets do |t|
      t.string :name, null: false, limit: 20
      t.string :manager, null: false, limit: 20
      t.string :mobile, null: false, limit: 20
      t.string :office_number, limit: 20
      t.string :location, limit: 80
      t.boolean :enabled , default: true, null: false

      t.timestamps null: false
    end
  end
end
