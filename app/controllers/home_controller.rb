class HomeController < ApplicationController

	def getUsers		
		@allUsers = User.get()
		if @allUsers
			render json: @allUsers
		else
			render json: {:status => 'error'}
		end

	end
end
