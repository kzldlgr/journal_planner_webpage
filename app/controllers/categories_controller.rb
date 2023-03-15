class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update ]
  before_action :authenticate_user!
  before_action :correct_user, only: %i[ show edit update ]
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end
  
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to category_url(@category), notice: 'New category has been added!'
    else
      render :new, status: :unproccessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to category_url(@category), notice: "Category was successfully updated."
    else
      render :edit, status: :unproccessable_entity
    end
  end

  def correct_user
    @category = current_user.category.find_by(id:params[:id])
    redirect_to categories_path, notice: "Not Authorized to action please Login" if @category.nil?
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:category_name, :user_id)
  end

end
