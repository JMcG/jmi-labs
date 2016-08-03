class BaseObjective < ActiveRecord::Base
  belongs_to :parent, :polymorphic => true, :touch => true
  accepts_nested_attributes_for :parent

  belongs_to :shipment


  def self.parent_objectives
    ActiveSupport::HashWithIndifferentAccess.new(
      objective_a: ObjectiveA,
      objective_b: ObjectiveB,
      objective_q: ObjectiveQ
    )
  end
end
