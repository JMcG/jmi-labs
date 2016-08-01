class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :hospital_id
      t.boolean :sent

      t.timestamps null: false
    end

    add_index :shipments, :hospital_id
  end
end
