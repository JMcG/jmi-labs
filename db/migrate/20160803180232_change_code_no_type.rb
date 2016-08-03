class ChangeCodeNoType < ActiveRecord::Migration
  def change
    change_column :base_objectives, :code_number, :string
  end
end
