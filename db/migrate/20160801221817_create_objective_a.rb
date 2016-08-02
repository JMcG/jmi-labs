class CreateObjectiveA < ActiveRecord::Migration
  def change
    create_table :objective_a do |t|
      t.integer :jmi_number
      t.string :organism_species
      t.datetime :admission_date
      t.string :spec_type, :default => "BC"
      t.string :source_of_bsia
      t.string :primary_diagnosis

      t.timestamps null: false
    end
  end
end
