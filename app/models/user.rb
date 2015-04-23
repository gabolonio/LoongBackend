class User < ActiveRecord::Base
	validates :name,
			  presence: true

	validates :fb_id,
			  presence: true,
			  uniqueness: true

	def self.get
		return User.all().order(:id)
	end

	def self.set(fb_id, name)
		currUser = User.find_or_create_by(fb_id: fb_id) do |user|
				user.name = name
				user.fb_id = fb_id
				end
		return currUser
	end
end
