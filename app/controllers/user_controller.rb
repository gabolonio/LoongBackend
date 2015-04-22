class UserController < ApplicationController
	protect_from_forgery :excet => [:setUser]

	def setUser
		@curUser = User.set(params[:id_fb], params[:name])
		if @curUser.save
			render json: @curUser 
		else
			render json: {:status => 'error'}
		end
	end
end
