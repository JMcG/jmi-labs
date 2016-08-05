class Hospital < ActiveRecord::Base
  has_many :shipments, :dependent => :destroy


  def starting_code_for(objective, code_prefix = nil)
    begin
      if code_prefix
        code_number = objective.joins(:shipment).where("shipments.hospital_id = ?", id).where("code_number like '%#{code_prefix}%' ").last.base_objective.code_number
      else
        code_number = objective.joins(:shipment).where("shipments.hospital_id = ?", id).last.base_objective.code_number
      end

      code_number.split("-").last.to_i
    rescue Exception => e
      return 0
    end
  end

  # Used to seed example data for hospital
  def seed_data

    target_isolates = rand(20) + 5
    shipment = shipments.new({:target_isolates => target_isolates})

    base_objective = BaseObjective.parent_objectives.to_a.sample
    if base_objective.first == "objective_b"
      bacteria_type = {:bacteria_type => ObjectiveB::bacteria_type_values.sample.last}
      code_prefix = bacteria_type.values.last
    end

    objective = base_objective.last

    starting_code = starting_code_for(objective, code_prefix ||= nil)

    shipment.target_isolates.times do |x|
      parent_objective  = objective.new(bacteria_type ||= {})
      
      code_number       = parent_objective.code_prefix+"#{(starting_code + x + 1)}"

      isolate           = shipment.isolates.new({code_number: code_number})
      isolate.parent    = parent_objective
      isolate.save
    end

    shipment.update_attribute(:objective_name, "#{objective.name} #{objective.new(bacteria_type ||= {}).name}")

  end
end
