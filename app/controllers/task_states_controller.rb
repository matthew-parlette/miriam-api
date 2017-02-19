class TaskStatesController < ApplicationController
  before_action :set_task_state, only: [:show, :update, :destroy]

  # GET /task_states
  def index
    @task_states = TaskState.all

    render json: @task_states
  end

  # GET /task_states/1
  def show
    render json: @task_state
  end

  # POST /task_states
  def create
    @task_state = TaskState.new(task_state_params)

    if @task_state.save
      render json: @task_state, status: :created, location: @task_state
    else
      render json: @task_state.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /task_states/1
  def update
    if @task_state.update(task_state_params)
      render json: @task_state
    else
      render json: @task_state.errors, status: :unprocessable_entity
    end
  end

  # DELETE /task_states/1
  def destroy
    @task_state.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_state
      @task_state = TaskState.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_state_params
      params.require(:task_state).permit(:name)
    end
end
