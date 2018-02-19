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
