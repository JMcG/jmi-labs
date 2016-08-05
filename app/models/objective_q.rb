class ObjectiveQ < ActiveRecord::Base
  include EnumeratedField

  after_initialize do |objective|
    objective.set_name
  end

  self.table_name = "objective_q"

  enum_field(:specimen_typea, 
    [
      ["Abscess (pus)", "AB"],
      ["Aspirate", "ASP"],
      ["GI tract/Bowel/Bile", "GI"],
      ["Peritoneal Fluid", "PRT"],
      ["Rectum/Rectal Swab", "REC"],
      ["Tissue", "TI"],
      ["Skin/Skin Structure/Wound/Drainage/Ulcer", "WD"],
      ["Other or Unknown", "OTH"]
    ], :allow_blank => true)

  def to_partial_path
    "objectives/objective_q/objective_q"
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

  def set_name
    self.name = "2016 SENTRY Pathogens Causing Intra-Abdominal Infections (IAI)"
  end
end
