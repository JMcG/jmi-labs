class ObjectiveB < ActiveRecord::Base
  include EnumeratedField

  self.table_name = "objective_b"

  enum_field(:bacteria_type, [['H. influenzae', 'HI'], ['M. catarrhalis', 'MCAT']], :allow_blank => false )

  has_one :base_objective, :as => :parent
  has_one :shipment, :through => :base_objective
  has_one :hospital, :through => :shipment
  
  accepts_nested_attributes_for :base_objective

  def to_partial_path
    "objectives/objective_b"
  end

  def self.has_requirements?
    true
  end

  def code_prefix
    "#{bacteria_type}-"
  end
end
