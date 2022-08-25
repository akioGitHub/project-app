class TasksController < ApplicationController

  def index
    # @task = Task.find(params[:project_id])
    query = 'SELECT * FROM tasks ORDER BY id DESC '
    @task = Task.find_by_sql(query)
  end

  def new
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    if @task.save
      redirect_to project_tasks_path
    else
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :item, :deadline).merge(project_id: @project.id)
  end

end
