class ObjectiveA < ActiveRecord::Base
  include EnumeratedField

  after_initialize do |objective|
    objective.set_name
  end

  self.table_name = "objective_a"

  enum_field(:source_of_bsia, 
    [
      ["Bone/Joint Fluid", "BON"],
      ["Dialysis Line", "DIA"],
      ["Endocarditis", "END"],
      ["Ear, nose, throat", "ENT"],
      ["Genital tract", "GEN"],
      ["GI tract/Bowel", "GI"],
      ["Intravenous/IV Line/ Catheter tip", "IV"],
      ["Lower respiratory tract (pneumonia)", "LRT"],
      ["Urine/Urinary Tract", "UR"],
      ["Skin/Skin structure/Wound/Drainage/Ulcer/ Abscess", "WD"],
      ["Other or Unknown", "OTH"]
    ], 
    :allow_blank => true )

  enum_field(:primary_diagnosis,
    [
      ["Abdominal pain", "ABD"],
      ["Bladder", "BLAD"],
      ["Burn", "BUR"],
      ["Cancer/Leukemia/Lymphoma", "CAN"],
      ["Cardiovascular", "CAR"],
      ["Cellulitis/Skin infection", "CELL"],
      ["Cystic fibrosis", "CF"],
      ["Cystitis", "CYS"],
      ["Diabetes", "DIAB"],
      ["Fever", "FEV"],
      ["Gastrointestinal", "GI"],
      ["HIV/AIDS", "HIV"],
      ["Infection", "INF"],
      ["Neurologic", "NEU"],
      ["Pulmonary", "PULM"],
      ["Renal", "REN"],
      ["Sepsis", "SEP"],
      ["Stroke", "STRO"],
      ["Transplantation", "TRA"],
      ["Trauma", "TRM"]
    ], :allow_blank => true )


  has_one :base_objective, :as => :parent
  has_one :shipment, :through => :base_objective
  has_one :hospital, :through => :shipment

  accepts_nested_attributes_for :base_objective


  def self.has_requirements?
    false
  end

  def code_prefix
    "A-"
  end

  def to_partial_path
    "objectives/objective_a/objective_a"
  end

  def set_name
    self.name = "2016 SENTRY Bloodstream Isolates (BSI)"
  end
end