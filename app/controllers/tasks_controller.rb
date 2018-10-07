class TasksController < ApplicationController
  def index
    @tasks = Task.all
    #Task.all? {|task| block }
# all?メソッドは、ブロック引数taskに要素を入れながらブロックを繰り返し実行し、
# ブロックの戻り値がすべて真であった場合にtrueを返します。
# ブロックが偽を返したときは、繰り返しを中断してfalseを返します。
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render 'new'
    end
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end

# updateボタンを押したときにupdateが呼ばれている。
  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @task = Task.find(params[:id])

    @task.destroy
    redirect_to tasks_path
  end

  private
  # createメソッドでtask_paramsを呼び出したときに使われるメソッド。
  def task_params
    params.require(:task).permit(:title, :description)
    # paramsは:taskを必要とする(require)
    # params:taskは許可する(permit):titleと:descriptionを
  end
end
