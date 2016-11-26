class PagesController < ApplicationController
  def index
    @tasks_uncompleted = completed_condition(false)
    @tasks_completed = completed_condition(true)
    @task = current_user.tasks.build
  end

  private

  def completed_condition(condition)
    # u can omit .all in this query
    # sql injection vulnerability in order http://rails-sqli.org/#order
    # refactor where(completed: condition) to model scopes
    # refactor order to model class method
    current_user.tasks.all.order(params[:sort] || 'created_at desc').where(completed: condition)
  end
end
