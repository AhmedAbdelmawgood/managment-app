class MissionsController < ApplicationController
	def index 
		@missions = current_user.missions_collection
	end
	
	def new 
		@mission = Mission.new 
	end
	
	def create
		@mission = Mission.create(mission_params)
		@mission.profile_id = current_user.profile.id
		if @mission.save
			@mission.users << (current_user) 
			@mission.admin
			flash[:success] = 'Mission created'
			redirect_to mission_path(@mission)
		else
			flash[:danger] = 'some field has Errors pls fix them first'
			render :new 
		end
	end
	
	def show
		@mission = current_user.missions.find(params[:id])
		unless @mission
			flash[:danger] = 'No such mission'
			redirect_to root_path
		end
	end

	def edit 
		@mission = Mission.find(params[:id])
	end 
	
	def update 
		@mission = Mission.find(params[:id])
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
	def new_users

	end
	def add_users
		@mission = Mission.find(params[:id])
		if current_user == @mission.admin 
			new_user = User.find_by(email: params[:new_users]['email'])
			if new_user
				@mission.users << new_user 
				redirect_to mission_path(@mission)
			else
				flash.now[:danger] = "user doesn't exist"
				render :new_users
			end

		else
			flash[:danger] = "Sorry you don't have permission to add users to this mission"
			redirect_to root_path
		end
	end
	private 
	
	def mission_params
		params.require(:mission).permit(:name, :begin_date, :deadline, :description, :priority)
	end
end
