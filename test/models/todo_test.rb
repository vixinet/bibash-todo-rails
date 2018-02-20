require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test "should be valid" do
    todo = build(:todo)
    assert todo.valid?
  end

  test "should require label" do
    todo = build(:todo, label: nil)
    refute todo.valid?
  end

  test "should have priority as enum" do
    todo = create(:todo, priority: :high)
    assert_equal "high", todo.priority
  end

  test "should have priority accepting high" do
    todo = build(:todo, priority: :high)
    assert todo.valid?
  end

  test "should have priority accepting normal" do
    todo = build(:todo, priority: :normal)
    assert todo.valid?
  end

  test "should have priority accepting low" do
    todo = build(:todo, priority: :low)
    assert todo.valid?
  end

  test "should have priority with default normal" do
    todo = build(:todo)
    assert_equal "normal", todo.priority
  end

  test "should respond to total" do
    assert_respond_to Todo, :total
  end

  test "should have total returning a value" do
    create(:todo)
    create(:todo)
    create(:todo)
    assert_equal 3, Todo.total
  end

  test "should respond to open_tasks" do
    assert_respond_to build(:todo), :open_tasks
  end

  test "should have open_tasks returning a value" do
    todo = create(:todo)

    first_task = nil
    second_task = nil
    
    assert_difference 'Task.count', 2 do
      first_task = create(:task, todo: todo, label: "label1", done: false)
      second_task = create(:task, todo: todo, label: "label2", done: true)
    end

    assert_includes todo.open_tasks, first_task
    assert_not_includes todo.open_tasks, second_task
  end

  test "should be destroyable" do
    todo = create(:todo)
    assert_difference 'Todo.count', -1 do 
      todo.destroy
    end
  end

  test "should be destroyed when project is destroyed" do
    todo = create(:todo)
    assert_difference 'Todo.count', -1 do 
      todo.project.destroy
    end
  end

  # TODO implement has many tasks
end
