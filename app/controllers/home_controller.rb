class HomeController < ApplicationController

  def index
    if user_signed_in? 
    @cat = Category.where(user_id: current_user.id).pluck(:id)
    @tas = Task.includes(:category).where(category_id: @cat)
    @tas1 = Task.includes(:category).where(category_id: @cat).pluck(:category_id)
    @cattas = Category.find(@tas1)
    else
    
    end
    
  end


end
