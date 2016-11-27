class PagesController < ApplicationController
  def index
    @tasks_uncompleted = completed_condition(false)
    @tasks_completed = completed_condition(true)
    @task = current_user.tasks.build
  end

  private

  def completed_condition(condition)
    current_user.tasks.sort_order(params[:sort]).completed(condition)
  end
end
