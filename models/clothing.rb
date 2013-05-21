class Clothing < ActiveRecord::Base
  validates_uniqueness_of :name, message: "Already exists!"
end