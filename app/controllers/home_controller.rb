class HomeController < ApplicationController

	def getUsers		
		@allUsers = User.get()
		if @allUsers
			render json: @allUsers
		else
			render json: {:status => 'error'}
			return false
		end

	end
end
