class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [ :show, :edit, :update, :destroy ]
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
    #@category = current_user.categories.build
  end

  def edit
  end
  
  def create
    @category = Category.new(category_params)
    # @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to category_tasks_path(@category), notice: 'New category has been added!'
    else
      render :new, notice: :unproccessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path(@category), notice: "Category was successfully updated."
    else
      render :edit, notice: :unproccessable_entity
    end
  end

  def correct_user
    @category = Category.find(params[:id])
    #@category = current_user.categories.find(params[:id])
    redirect_to category_path, notice: "Not authorized to do action" if @category.nil?
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:category_name, :user_id)
  end

end
