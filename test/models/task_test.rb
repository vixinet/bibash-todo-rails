require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "should be valid" do
    task = build(:task)
    assert task.valid?
  end

  test "should require label" do
    task = build(:task, label: nil)
    refute task.valid?
  end

  test "should have unique label within the todo" do
    common_label = "unique label"
    todo = create(:todo)
    first_task = create(:task, todo: todo, label: common_label)
    second_task = build(:task, todo: todo, label: common_label)
    refute second_task.valid?
  end

  test "should allow same label for different todos" do
    common_label = "unique label"
    first_task = create(:task, todo: create(:todo), label: common_label)
    second_task = build(:task, todo: create(:todo), label: common_label)
    assert second_task.valid?
  end

  test "should require todo" do
    task = build(:task, todo: nil)
    refute task.valid?
  end

  test "should initialize done as false" do
    task = build(:task)
    assert_not task.done?
  end

  test "should have one project" do
    task = build(:task)
    assert task.project
  end

  test "should be destroyable" do
    task = create(:task)
    assert_difference 'Task.count', -1 do
      task.destroy
    end
  end

  test "should be destroyed when todo is destroyed" do
    task = create(:task)
    assert_difference 'Task.count', -1 do
      task.todo.destroy
    end
  end

  test "should be destroyed when project is destroyed" do
    task = create(:task)
    assert_difference 'Task.count', -1 do
      task.project.destroy
    end
  end
end
