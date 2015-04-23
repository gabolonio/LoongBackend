class UserController < ApplicationController
	protect_from_forgery :excet => [:setUserAsChild, :setUserAsParent]

	def setUserAsChild
		parent = User.find_by(fb_id: params[:fb_id_parent])

		if !parent
			render json: {status: 'error', cause: 'parent not found'}
			return false
		else
			@newUser = setUser(params[:fb_id], params[:name])
			if @newUser
			   @newRelation = Relation.setRelation(parent.id, @newUser.id)
			   if @newRelation.save
					render json: {status: :ok, user: @newUser, relation: @newRelation}
			   else
					render json: {status: 'error', cause: 'could not save user'}
			   		return false
			   end	
			end
		end

	end

	def setUserAsParent
		@newUser = setUser(params[:fb_id], params[:name])
		if @newUser
			render json: {status: :ok, user: @newUser}
		end
	end


	def setUser(fb_id, name)
		curUser = User.set(fb_id, name)

		relationParent = Relation.find_by(father: curUser.id)
		relationChild = Relation.find_by(son: curUser.id)

		if relationParent 
			render json: {status: 'error', cause: 'User is parent'}
			return false
		elsif relationChild
			render json: {status: 'error', cause: 'User is child'}
			return false
		elsif curUser.save
			return curUser
		else
			render json: {status: 'error', cause: 'could not save user'}
			return false
		end
		
	end
end
