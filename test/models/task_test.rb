require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "task should not save without a name" do
    task = Task.new
    assert_not task.save, "Saved the task without a name"
  end

  test "should create a task with only a name" do
    task = Task.new
    task.name = "Test task"
    assert task.save!, "Could not save task with only a name"
    assert task.priority_id == TaskPriority.where(name: "medium").first.id, "Priority did not default to medium"
    assert task.state_id == TaskState.where(name: "backlog").first.id, "State did not default to backlog"
    assert task.type_id == TaskType.where(name: "task").first.id, "Type did not default to task"
    assert task.archived == false, "Archived did not default to false"
  end

  test "should create task with attributes defined" do
    task = Task.new
    task.name = "Test task with defined attributes"
    task.description = "A description for the test task"
    task.date = Date.new(2017, 1, 1)
    task.priority = TaskPriority.where(name: "high").first
    task.state = TaskState.where(name: "icebox").first
    task.type = TaskType.where(name: "question").first
    task.archived = true
    assert task.save, "Could not save task with attributes defined"
    assert task.description.include?("A description"), "Description did not set"
    assert task.date == Date.new(2017, 1, 1), "Date did not properly set to 2017-01-01"
    assert task.priority == TaskPriority.where(name: "high").first, "Priority did not set to high"
    assert task.state == TaskState.where(name: "icebox").first, "State did not set to icebox"
    assert task.type == TaskType.where(name: "question").first, "Type did not set to question"
    assert task.archived == true, "Archived did not set to true"
  end
end
