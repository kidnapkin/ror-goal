class UsersController < ApplicationController
  def index
    @tasks = current_user.tasks.all.order("created_at desc")
    @task  = current_user.tasks.build
  end

  def show
    @user = current_user
  end
end
