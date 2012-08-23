module UsersHelper
	def display_user(user)
		link_to(user.name, user_path(user)) + " (#{user.reputation_value_for(:votes).to_i}) - #{user.title}"
	end
end
