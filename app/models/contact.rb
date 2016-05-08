class Contact < ActiveRecord::Base
  
	belongs_to :user
	has_many :contact_items
# 	attr_accessor :records
# 	def add_record(user)
# 	 records << record_item(user)
# 	end

# 	def records
# 		@records ||= []
		
# 	end

# 	def record_item(user)
#   		result = {user_name: user_name(user), user_email:user_email(user),
#   		 user_image: user_image(user)}
# 	end
  
# 	private 
	
# 	def user_name(user)
#   		user.name
# 	end

# 	def user_image(user) 
#   		user.profile.user_image 
# 	end
# 	def user_email(user)
#   		user.email
# 	end
end

