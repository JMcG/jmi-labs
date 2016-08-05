class BaseObjective < ActiveRecord::Base
  include EnumeratedField
  belongs_to :parent, :polymorphic => true, :touch => true
  accepts_nested_attributes_for :parent

  belongs_to :shipment

  enum_field(:serviceb, 
    [
      ["Ambulatory/Outpatient", "AMB"],
      ["Burn", "BUR: Cardiothoracic/Pulmonary", "CAR"],
      ["Dermatology", "DER"],
      ["Dialysis", "DIA"],
      ["Ear, Nose, Throat (Otolarynology)", "ENT"],
      ["Emergency", "ER"],
      ["Family Practice", "FAM"],
      ["Gastroenterology/GI", "GEN"],
      ["Geriatics", "GER"],
      ["Hematology/Oncology", "HEM"],
      ["Intensive Care Unit", "ICU"],
      ["Infectious Disease", "ID"],
      ["Long-Term Care", "LTC"],
      ["Internal Medicine", "MED"],
      ["Neurology", "NEU"],
      ["Neurosurgery", "NS"],
      ["Obstetrics/Gynecology", "OBGYN"],
      ["Ophthalmology", "OPH"],
      ["Orthopedics", "ORT"],
      ["Pediatrics/Neonate", "PED"],
      ["Psychiatry", "PSY"],
      ["Renal", "REN"],
      ["Rehabilitation", "RH"],
      ["Surgery", "SUR"],
      ["Transplant", "TRA"],
      ["Trauma", "TRM"],
      ["Urology", "URO"]
    ], :allow_blank => true)


  def self.parent_objectives
    ActiveSupport::HashWithIndifferentAccess.new(
      objective_a: ObjectiveA,
      objective_b: ObjectiveB,
      objective_q: ObjectiveQ
    )
  end
end
