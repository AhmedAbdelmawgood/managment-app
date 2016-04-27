class MissionsController < ApplicationController
	def index 

	end
	
	def new 
		@mission = Mission.new 
	end
	
	def create
		@mission = Mission.create(mission_params)
		@mission.profile_id = current_user.profile.id
		if @mission.save 
			flash[:success] = 'Mission created'
			redirect_to mission_path(@mission)
		else
			flash[:danger] = 'some field detects Errors pls fix them first'
			render :new 
		end
	end
	
	def show
		@mission = current_user.missions.find_by(id:params[:id])
		unless @mission
			flash[:danger] = 'No such mission'
			redirect_to root_path
		end 
	end

	def edit 
	
	end 
	
	def update 
	
	end

	def delete
	
	end 
	private 
	
	def mission_params
		params.require(:mission).permit(:name, :begin_date, :deadline, :description, :priority)
	end
end
