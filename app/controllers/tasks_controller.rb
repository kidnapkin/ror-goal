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
      redirect_to task_path
      flash[:notice] = 'Task was successfully updated.'
    else
      flash[:danger] = 'Failed to update!'
      render 'tasks/edit'
    end
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to root_url
      flash[:notice] = 'Task created!'
    else
      redirect_to root_url
      flash[:danger] = "Failed to create! #{@task.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Task deleted' }
      format.js
    end
  end

  def bulk_destroy
    @tasks = Task.where(id: params[:task_ids])
    if @tasks.exists? && @tasks.delete_all
      redirect_to root_url
      flash[:notice] = 'Tasks deleted'
    else
      redirect_to root_url
      flash[:danger] = 'Select tasks to delete'
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
