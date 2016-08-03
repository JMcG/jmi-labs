class Shipment < ActiveRecord::Base
  belongs_to :hospital
  has_many :isolates, :class_name => :BaseObjective
  
end
