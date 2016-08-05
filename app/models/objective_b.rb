class ObjectiveB < ActiveRecord::Base
  include EnumeratedField

  after_initialize do |objective|
    objective.set_name
  end

  self.table_name = "objective_b"

  enum_field(:bacteria_type, [['H. influenzae', 'HI'], ['M. catarrhalis', 'MCAT']], :allow_blank => false )

  enum_field(:specimen_typea,
    [
      ["Bronchoalveolar lavage/wash", "BAL"],
      ["Eye/Conjunctiva", "EYE"],
      ["Invasive Pulmonary (not BAL)", "IP"],
      ["Middle Ear Fluid", "ME"],
      ["Pleural Fluid", "PF"],
      ["Sinus", "SI"],
      ["Sputum (Lower respiratory tract)", "SP"],
      ["Endotracheal Tube/Tracheal Aspirate", "TA"],
      ["Upper Respiratory Tract", "URT"],
      ["Other or Unknown", "OTH"]
    ], :allow_blank => true )

  has_one :base_objective, :as => :parent
  has_one :shipment, :through => :base_objective
  has_one :hospital, :through => :shipment
  
  accepts_nested_attributes_for :base_objective

  def to_partial_path
    "objectives/objective_b/objective_b"
  end


  def self.has_requirements?
    true
  end

  def code_prefix
    "#{bacteria_type}-"
  end

  def set_name
    self.name = "2016 SENTRY Fastidious CA RTI Species Isolates (#{bacteria_type})"
  end
end
