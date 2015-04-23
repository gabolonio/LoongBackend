class Relation < ActiveRecord::Base
	
	validates :father,
			presence: true

	validates :state,
			presence: true

	def self.setRelation(parent_id, user_id)
		newRelation =Relation.new()
		newRelation.father = parent_id
		newRelation.son = user_id
		newRelation.amount = 0

		return newRelation
		
	end

end
