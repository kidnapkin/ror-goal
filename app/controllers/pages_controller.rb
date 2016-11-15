class PagesController < ApplicationController
  def index
    @tasks_uncompleted = current_user.tasks.all.order(params[:sort] || "created_at desc").where(completed: false)
    @tasks_completed = current_user.tasks.all.order(params[:sort] || "created_at desc").where(completed: true)
    @task  = current_user.tasks.build
  end
end
