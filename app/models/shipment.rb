class Shipment < ActiveRecord::Base
  belongs_to :hospital, :counter_cache => true
  has_many :isolates, :class_name => :BaseObjective, :dependent => :destroy
  
end
