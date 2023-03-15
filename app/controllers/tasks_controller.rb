class TasksController < ApplicationController
 # before_action :get_category
  
  def index
   # @tasks = Task.all
   # @tasks = @category.tasks
    @tasks = Task.where(category_id: params[:category_id])
    
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
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to category_tasks_path, notice: 'New task has been added!'
    else
      render :new, status: :unproccessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_url(@task), notice: "Task was successfully updated."
    else
      render :edit, status: :unproccessable_entity 
    end
  end

  private

  def get_category
    @category = Category.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_name, :task_body, :user_id, :status, :category_id)
  end

end
