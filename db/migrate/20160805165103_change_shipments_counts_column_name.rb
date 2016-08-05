class ChangeShipmentsCountsColumnName < ActiveRecord::Migration
  def change
    rename_column :hospitals, :shipment_count, :shipments_count
  end
end
