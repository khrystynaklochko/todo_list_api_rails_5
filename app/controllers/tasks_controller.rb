class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :check_loged_in_user, only: [:create, :update, :destroy]

 # GET /tasks
  def index
    tasks = Task.all
    tasks = tasks.page(params[:page] ? params[:page][:number] : 1)
    render json: tasks, meta: pagination_meta(tasks), include: ['user']
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    task = Task.new(task_params)
    if task.save
      render json: task, status: :created
    else
      show_error(task, :unprocessable_entity)
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update_attributes(task_params)
      render json: @task, status: :ok
    else
      show_error(@task, :unprocessable_entity)
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    head 204
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      begin
        @task = Task.find params[:id]
      rescue ActiveRecord::RecordNotFound
        task = Task.new
        task.errors.add(:id, "Undifined ud")
        show_error(task, 404) and return
      end
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
