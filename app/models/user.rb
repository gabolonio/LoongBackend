class User < ActiveRecord::Base
	validates :name,
			  presence: true

	validates :fb_id,
			  presence: true,
			  uniqueness: true

	def self.getUsers
		return User.all().order(:id)
	end

	def self.set(id_fb, name)
		currUser = User.find_or_create_by(fb_id: id_fb) do |user|
				user.name = name
				user.fb_id = id_fb
				end
		return currUser
	end
end
