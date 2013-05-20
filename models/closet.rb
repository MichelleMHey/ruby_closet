class Closet < ActiveRecord::Base
	belongs_to :closet_owner
	has_many :clothes
end