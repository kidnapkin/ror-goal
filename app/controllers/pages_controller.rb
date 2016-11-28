class PagesController < ApplicationController
  def index
    @tasks_uncompleted = completed_condition(false)
    @tasks_completed = completed_condition(true)
    @task = current_user.tasks.build
  end

  private

  def completed_condition(condition)
    current_user.tasks.sort_order(sort_column).completed(condition)
  end
  
  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : { created_at: :desc }
  end
end
