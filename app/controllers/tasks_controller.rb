class TasksController < ApplicationController
  before_action :set_task, only: [:show,:edit, :update,]
  before_action :require_task_logged_in

  def index
    if logged_in?
      @tasks = current_user.tasks.page(params[:page]).per(3)
      #@tasks = Task.all.page(params[:page]).per(3)
    else
      render :new
    end
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクの投稿に失敗しました。'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to tasks_url
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end
  

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = 'タスクを削除しました。'
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id]) 
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @user
      redirect_to user_url
    end
  end
end
