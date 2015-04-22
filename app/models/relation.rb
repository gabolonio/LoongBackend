class Relation < ActiveRecord::Base
	
	validates :father,
			presence: true

	validates :state,
			presence: true

end
