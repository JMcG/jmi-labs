class AddCountsToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :target_isolates, :integer
    add_column :shipments, :isolate_count, :integer
  end
end
