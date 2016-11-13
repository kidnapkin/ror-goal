class TasksController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to root_url
      flash[:notice] = "Task created!"
      
    else
      render root_url
    end
  end
  
  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
  
end
