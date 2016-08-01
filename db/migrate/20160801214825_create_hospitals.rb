class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.integer :shipment_count

      t.timestamps null: false
    end
  end
end
