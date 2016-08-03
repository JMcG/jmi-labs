class ObjectiveQ < ActiveRecord::Base
  self.table_name = "objective_q"

  def to_partial_path
    "objectives/objective_q"
  end

  has_one :base_objective, :as => :parent
  has_one :shipment, :through => :base_objective
  has_one :hospital, :through => :shipment
  
  accepts_nested_attributes_for :base_objective

  def self.has_requirements?
    false
  end

  def code_prefix
    "Q-"
  end
end
