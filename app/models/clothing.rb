class Clothing < ActiveRecord::Base
  validates_uniqueness_of :name, message: 'Clothing already exists!'
  attr_accessible :style, :temperature, :clothing_type
end