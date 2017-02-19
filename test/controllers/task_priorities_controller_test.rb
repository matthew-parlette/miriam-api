require 'test_helper'

class TaskPrioritiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_priority = TaskPriority.first
  end

  test "should get index" do
    get task_priorities_url, as: :json
    assert_response :success
  end

  test "should create task_priority" do
    assert_difference('TaskPriority.count') do
      @task_priority = TaskPriority.new
      @task_priority.name = "test priority"
      post task_priorities_url, params: { task_priority: { name: @task_priority.name } }, as: :json
    end

    assert_response 201
  end

  test "should show task_priority" do
    get task_priority_url(@task_priority), as: :json
    assert_response :success
  end

  test "should update task_priority" do
    patch task_priority_url(@task_priority), params: { task_priority: { name: @task_priority.name } }, as: :json
    assert_response 200
  end

  test "should destroy task_priority" do
    assert_difference('TaskPriority.count', -1) do
      delete task_priority_url(@task_priority), as: :json
    end

    assert_response 204
  end
end
