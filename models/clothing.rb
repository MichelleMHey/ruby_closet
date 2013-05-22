class Clothing < ActiveRecord::Base
  validates_uniqueness_of :name, message: 'Clothing already exists!'
end