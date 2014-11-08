class TasksController < ApplicationController
  before_action :load_resources, only: [:show, :edit, :update, :destroy, :ajax_edit]
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def ajax_edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to user_tasks_path(current_user) }
        format.js { render plain: "Success" }
      else
        format.html { render 'edit' }
        format.js { render plain: "Fail" }
      end
    end
  end

  def destroy
    @task.destroy
    redirect_to user_tasks_path(current_user)
  end

  protected

  def load_resources
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :finished)
  end
end
