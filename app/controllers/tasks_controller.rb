class TasksController < ApplicationController
  before_action :get_category
  before_action :authenticate_user!
  before_action :get_task, only: [ :show, :edit, :update, :destroy ]
  def index
   @tasks = @category.tasks
   # @tasks = Task.where(category_id: params[:category_id], id: params[:id])
    
  end

  def show
  end

  def new
    @task = @category.tasks.build
  end

  def edit
  end

  def create
    #@task = Tasks.new(task_params)
    @task = @category.tasks.new(task_params)
    
    if @task.save
      redirect_to category_tasks_path, notice: 'New task has been added!'
    else
      render :new, notice: :unproccessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to category_tasks_path, notice: "Task was successfully updated."
    else
      render :edit, notice: :unproccessable_entity 
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
     redirect_to category_tasks_path, notice: "Task was successfully destroyed." 
  end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end

  def get_task
    if params[:id]
      @task = Task.find(params[:id])
    end
  end

  def task_params
    params.fetch(:task, {}).permit(:task_name, :task_body, :status, :category_id, :start_time, :end_time)
  end

end
