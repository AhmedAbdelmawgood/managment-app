class ContactItem < ActiveRecord::Base
	belongs_to :contact
	def create_item(user)
		self.user_name = get_user_name(user)
		self.user_email = get_user_email(user)
		user_image = get_user_image(user)
	end

	private

	def get_user_name(user)
  		user.name
	end

	def get_user_image(user) 
  		user.profile.user_image 
	end
	def get_user_email(user)
  		user.email
	end

end
