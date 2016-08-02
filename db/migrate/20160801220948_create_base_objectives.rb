class CreateBaseObjectives < ActiveRecord::Migration
  def change
    create_table :base_objectives do |t|
      t.string :parent_type
      t.integer :parent_id
      t.integer :age
      t.string :sex
      t.datetime :culture_date
      t.string :serviceb
      t.integer :accession_number
      t.string :icu
      t.string :nosocomial
      t.integer :code_number
      t.integer :shipment_id

      t.timestamps null: false
    end

    add_index :base_objectives, :parent_id
    add_index :base_objectives, :parent_type
    add_index :base_objectives, :shipment_id
  end
end
