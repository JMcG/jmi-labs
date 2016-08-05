class AddNameToObjectives < ActiveRecord::Migration
  def change
    add_column :objective_a, :name, :string
    add_column :objective_b, :name, :string
    add_column :objective_q, :name, :string
  end
end
