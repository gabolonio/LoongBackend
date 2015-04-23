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

	def self.get(id)
		curRelation = Relation.find(params[:id_register])
		if !curRelation.nil?
			return curRelation
		else
			render json: {status: 'error', cause: 'Relation not found'}
			return false
		end
	end

end
