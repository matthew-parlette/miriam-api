require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @simple = tasks(:simple)
    @everything = tasks(:everything)
  end

  test "should get index" do
    get tasks_url, as: :json

    assert_response :success
    json = JSON.parse(@response.body)
    assert_equal json.length, 2
  end

  test "should create task with only a name" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { name: @simple.name } }, as: :json
    end

    assert_response 201
    task = JSON.parse(@response.body)
    assert_equal task["name"], "simple-task"
  end

  test "should create task with all fields defined" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { archived: @everything.archived, date: @everything.date, description: @everything.description, name: @everything.name, priority_id: @everything.priority_id, state_id: @everything.state_id, type_id: @everything.type_id } }, as: :json
    end

    assert_response 201
    json = JSON.parse(@response.body)
  end

  test "should show task" do
    get task_url(@simple), as: :json
    assert_response :success
  end

  test "should update task" do
    patch task_url(@simple), params: { task: { archived: @simple.archived, date: @simple.date, description: @simple.description, name: @simple.name, priority_id: @simple.priority_id, state_id: @simple.state_id, type_id: @simple.type_id } }, as: :json
    assert_response 200
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@simple), as: :json
    end

    assert_response 204
  end

  test "should create task with links" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { name: "new task with a link", links_attributes: [ { name: "reddit", url: "https://www.reddit.com" } ] } }, as: :json
    end

    assert_response 201
    task = JSON.parse(@response.body)
    assert_includes task, "links", "Task did not return a links section"
    assert_equal task["links"].length, 1, "Task did not create with a link"
  end

  test "should update task to add links" do
    patch task_url(@everything), params: { task: { links_attributes: [ { name: "reddit", url: "https://www.reddit.com" } ] } }, as: :json

    assert_response 200
    task = JSON.parse(@response.body)
    assert_equal task["links"].length, 1, "Failed adding first link to task"

    patch task_url(@everything), params: { task: { links_attributes: [ { name: "github", url: "https://github.com" } ] } }, as: :json

    assert_response 200
    task = JSON.parse(@response.body)
    assert_equal task["links"].length, 2, "Failed adding second link to task"
  end
end
