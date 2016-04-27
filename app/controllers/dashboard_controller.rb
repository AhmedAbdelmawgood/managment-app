class DashboardController < ApplicationController
  def index
  	@missions = current_user.missions.accomplished(false).order(:priority).first(3) 
  	respond_to do |format| 
  		format.html 
  		# format.js
  	end
  end
  def report
  	render text: 'This feature is currently unavailable'
  end
end
