class HomeController < ApplicationController

	def home		
		@allUsers = User.getUsers()
		if @allUsers
			render json: @allUsers
		else
			render json: {:status => 'error'}
		end

	end
end
