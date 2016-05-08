class ContactItemsController < ApplicationController
  def create
  	user = User.find_by(email:params[:email]) 
	  	respond_to do |format|
			if user
  				@contact = current_user.contact.contact_items.new
  				@contact.create_item(user)
  				if current_user.contact_items.any?{|con| con.user_email == @contact.user_email}
  				@error = 'Already existed user in your contact'
 				format.js {render 'error.js.erb'} 				
  				else	
				format.js {render "create.js.erb"}	
				end
			else
				@error = "non-existent user" 
				format.js {render 'error.js.erb'}
			end
		end
  end

  def delete
  	respond_to do |format|
  		format.js
  	end 
  end
end
	