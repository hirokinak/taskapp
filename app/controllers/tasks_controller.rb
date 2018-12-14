class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page])
  end

  def new
    @task = Task.new
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "タスク「#{@task.name}」を更新しました。" 
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to @task, notice: "タスク「#{@task.name}」を削除しました。" 
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  private

    def task_params
      params.require(:task).permit(:name, :description, :deadline, :status, :priority)
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
