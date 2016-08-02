class CreateObjectiveB < ActiveRecord::Migration
  def change
    create_table :objective_b do |t|
      t.integer :jmi_number
      t.string :specimen_typea
      t.string :bacteria_type

      t.timestamps null: false
    end
  end
end
