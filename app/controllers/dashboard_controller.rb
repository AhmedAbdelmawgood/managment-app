class DashboardController < ApplicationController
  def index
  	# @missions = current_user.missions.accomplished(false).order(:priority).first(3) 

    respond_to do |format| 
  		format.html 
  		# format.js
  	end
  end
  def handler
    request = params[:request].to_sym 
    if request 
      case request 
        when :tasks then self.send(request)
        when :missions then self.send(request)
        when :contact then self.send(request)
        when :payments then self.send(request)
        else
          self.send(:malieci_request)
      end
    end
    respond_to do |format|
      format.js {render "#{params[:request]}.js.erb"}
    end
  end
  def report
    render text: 'This feature is currently unavailable'
  end

  private   
  
  def malieci_request
    "Stop fuccken trying to hack the server"
  end
  def tasks
    @tasks = current_user.tasks
  end
  def missions
    @missions = current_user.missions

  end
  def contact
    respond_to do |format|
      format.js
    end
  end
  def payments
    respond_to do |format|
      format.js
    end
  end


end
