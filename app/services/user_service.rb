class UserService
	class << self
		def get_user(user_id=false,name)
			if user_id != false
				return User.find(user_id)
			end

			user = User.new(name: name)
			if user.save
				return user
			end
		end
	end
end