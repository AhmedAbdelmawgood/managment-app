class MissionsController < ApplicationController
	def index 
		@missions = current_user.missions.all.order(:accomplished)
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
		@mission = mission.find(params[:id])
	end 
	
	def update 
		@mission = mission.find(params[:id])
		@mission.update_attribute(mission_params)
		if @mission.save 
			flash[:success] = 'Mission updated'
			redirect_to @mission 
		else
			flash.now[:error] = "Error occuered while updating"
			render :edit
		end
	end

	def delete
	
	end 
	private 
	
	def mission_params
		params.require(:mission).permit(:name, :begin_date, :deadline, :description, :priority)
	end
end
