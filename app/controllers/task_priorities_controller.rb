class TaskPrioritiesController < ApplicationController
  before_action :set_task_priority, only: [:show, :update, :destroy]

  # GET /task_priorities
  def index
    @task_priorities = TaskPriority.all

    render json: @task_priorities
  end

  # GET /task_priorities/1
  def show
    render json: @task_priority
  end

  # POST /task_priorities
  def create
    @task_priority = TaskPriority.new(task_priority_params)

    if @task_priority.save
      render json: @task_priority, status: :created, location: @task_priority
    else
      render json: @task_priority.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /task_priorities/1
  def update
    if @task_priority.update(task_priority_params)
      render json: @task_priority
    else
      render json: @task_priority.errors, status: :unprocessable_entity
    end
  end

  # DELETE /task_priorities/1
  def destroy
    @task_priority.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_priority
      @task_priority = TaskPriority.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_priority_params
      params.require(:task_priority).permit(:name)
    end
end
