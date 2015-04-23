class RegisterController < ApplicationController
	protect_from_forgery :excet => [:updateRelation]
	
	def updateRelationWithPayment
		@curRelation = Relation.find(params[:id_register])
		curAmount = params[:amount].to_f 

		if @curRelation.state != "done" && curAmount != 0
			@curRelation.amount = curAmount
			@curRelation.state = "done"
			if @curRelation.save
				render json: {status: :ok, relation: @curRelation}
			else
				render json: {status: 'error', cause: 'Could not save Relation'}
			end
		else
			render json: {status: 'error', cause: 'Relation already donated or amount is 0'}
		end

	end
end
