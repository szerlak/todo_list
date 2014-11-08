class TasksController < ApplicationController
  before_action :load_resources, only: [:show, :edit, :update, :destroy, :ajax_edit]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_parameters)
    redirect_to tasks_path
  end

  def show
  end

  def edit
  end

  def ajax_edit
  end

  def update
    @task.update!(task_parameters)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  protected

  def load_resources
    @task = Task.find(params[:id])
  end

  def task_parameters
    params.require(:task).permit(:title, :description, :finished)
  end
end
