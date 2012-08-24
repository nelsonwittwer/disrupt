module UsersHelper
	def display_user(user)
		link_to(user.name, user_path(user)) + " (#{user.reputation_value_for(:votes).to_i}) - #{user.title}"
	end

	def display_avatar_thumb(user)
		image_tag user.avatar.url(:thumb)
	end

	def display_avatar(user)
		image_tag user.avatar.url(:full)
	end
end
