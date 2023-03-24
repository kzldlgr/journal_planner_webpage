class HomeController < ApplicationController
  before_action :get_all_task
  def index
  end

  def get_all_task
    if user_signed_in?
    @cat = Category.where(user_id: current_user.id).pluck(:id)
    @tas = Task.includes(:category).where(category_id: @cat)
    @tas1 = Task.includes(:category).where(category_id: @cat).pluck(:category_id)
    @cattas = Category.find(@tas1)
    @dailies = @tas.where(
      start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
    )
    end
  end



end
