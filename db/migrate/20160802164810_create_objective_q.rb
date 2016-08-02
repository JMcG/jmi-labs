class CreateObjectiveQ < ActiveRecord::Migration
  def change
    create_table :objective_q do |t|
      t.string :organism_species
      t.string :specimen_typea

      t.timestamps null: false
    end
  end
end
