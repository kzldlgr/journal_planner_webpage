class HomeController < ApplicationController
  
  def index
    if user_signed_in? 
    @categories = Category.where(user_id: current_user.id).pluck(:id)
    @tasks = Task.includes(:category).where(category_id: @categories)
    else
       
    end
  end


end
