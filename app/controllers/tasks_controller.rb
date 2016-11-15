class TasksController < ApplicationController
  before_action :set_task, only: [:destroy, :edit, :update, :show]
  
  def index
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to root_url
      flash[:notice] = 'Task was successfully updated.'
    else
      redirect_to root_url
      flash[:danger] = "Failed to update!"
    end
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to root_url
      flash[:notice] = "Task created!"
    else
      redirect_to root_url
      flash[:danger] = "Failed to create!"
    end
  end
  
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: "Task deleted" }
      format.js
    end 
  end
  
  private
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:title, :description, :priority, :due_date, :completed)
    end
  
end