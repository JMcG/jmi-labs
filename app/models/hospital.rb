class Hospital < ActiveRecord::Base
  has_many :shipments


  def starting_code_for(objective, code_prefix = nil)
    if code_prefix
      code_number = objective.joins(:shipment).where("shipments.hospital_id = ?", id).where("code_number like '%#{code_prefix}%' ").last.base_objective.code_number
    else
      code_number = objective.joins(:shipment).where("shipments.hospital_id = ?", id).last.base_objective.code_number
    end

    code_number.split("-").last.to_i rescue 0
  end
end
