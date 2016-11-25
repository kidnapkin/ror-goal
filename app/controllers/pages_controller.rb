class PagesController < ApplicationController
  def index
    @tasks_uncompleted = completed_condition(false)
    @tasks_completed = completed_condition(true)
    @task = current_user.tasks.build
  end

  private

  def completed_condition(condition)
    current_user.tasks.all.order(params[:sort] || 'created_at desc').where(completed: condition)
  end
end
