require 'test_helper'

class TaskStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_state = TaskState.first
  end

  test "should get index" do
    get task_states_url, as: :json
    assert_response :success
  end

  test "should create task_state" do
    assert_difference('TaskState.count') do
      post task_states_url, params: { task_state: { name: @task_state.name } }, as: :json
    end

    assert_response 201
  end

  test "should show task_state" do
    get task_state_url(@task_state), as: :json
    assert_response :success
  end

  test "should update task_state" do
    patch task_state_url(@task_state), params: { task_state: { name: @task_state.name } }, as: :json
    assert_response 200
  end

  test "should destroy task_state" do
    assert_difference('TaskState.count', -1) do
      delete task_state_url(@task_state), as: :json
    end

    assert_response 204
  end
end
