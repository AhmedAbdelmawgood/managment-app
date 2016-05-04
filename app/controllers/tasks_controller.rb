class TasksController < ApplicationController
  def index
  	
  end
  def new 
  	@task = Task.new 
  	# @mission = params[:mission_id]
  end
  def create
  	@task = Task.new(white_params)
  	@task.mission_id = params[:mission_id]
  	if @task.save
  		flash[:success] = 'Task Created'
  		redirect_to mission_path(params[:mission_id])
  	else
  		flash.now[:danger] = 'Something is not quiet right'
  		render :new
  	end 
  end
  def edit
  	@task  = Task.find(params[:id])
  end
  def update
  	@task = Task.find(params[:id])
  	@task.update(white_params)
  	flash[:success] = "Task #{@task.title} Updated"
  	redirect_to mission_path(params[:mission_id])
  end
  def show 
  end
  def accomplished
    @task = Task.find_by(id: params[:id])
    
    if @task && @task.update_attributes(accomplished: !@task.accomplished) 
      
      respond_to do |format|
        format.js
      end
    else 
      render status: 404   
    end
  end
  private
  def white_params
  	params.require(:task).permit(:title, :description, :priority)
  end
end
