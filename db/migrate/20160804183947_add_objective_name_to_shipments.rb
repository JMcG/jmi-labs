class AddObjectiveNameToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :objective_name, :string 
  end
end
