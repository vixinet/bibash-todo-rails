require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should be valid" do
    project = build(:project)
    assert project.valid?
  end

  test "should require name" do
    project = build(:project, name: nil)
    refute project.valid?
  end

  test "should deny rating under 1" do
    project = build(:project, rating: 0)
    refute project.valid?
  end

  test "should deny rating above 5" do
    project = build(:project, rating: 6)
    refute project.valid?
  end

  test "should accept no rating" do
    project = build(:project, rating: nil)
    assert project.valid?
  end

  test "should accept rating 1" do
    project = build(:project, rating: 1)
    assert project.valid?
  end

  test "should accept float rating" do
    project = create(:project, rating: 1.5)
    assert_equal 1.5, project.reload.rating
  end

  test "should have status as enum" do
    project = create(:project, status: :open)
    assert_equal "open", project.status
  end

  test "should have status accepting open" do
    project = build(:project, status: :open)
    assert project.valid?
  end

  test "should have status accepting close" do
    project = build(:project, status: :close)
    assert project.valid?
  end

  test "should have status with default open" do
    project = build(:project)
    assert_equal "open", project.status
  end

  test "should have to_s" do
    project = build(:project, name: "Reshel")
    assert_equal "project Reshel", project.to_s
  end

  test "should respond to total" do
    assert_respond_to Project, :total
  end

  test "should have total returning a value" do
    assert_difference 'Project.total', 3 do 
      create(:project)
      create(:project)
      create(:project)
    end
  end

  test "should respond to statuses_for_select" do
    assert_respond_to Project, :statuses_for_select
  end

  test "should have statuses_for_select returning a value" do
    assert_equal [["Open", "open"], ["Close", "close"]], Project.statuses_for_select
  end

  test "should have many todos" do
    project = create(:project_with_todos)
    assert_equal 3, project.todos.size
  end

  test "should have many milestones" do
    project = create(:project_with_milestones)
    assert_equal 3, project.milestones.size
  end

  test "should be destroyable" do
    project = create(:project)
    assert_difference 'Project.count', -1 do 
      project.destroy
    end
  end

  test "should have many labels" do
    project = create(:project_with_labels)
    assert_equal 5, project.labels.size
  end

  test "should not be destroyed when label is destroyed" do
    project = create(:project_with_labels)

    assert_no_difference 'Project.count' do
      project.labels.first.destroy
    end

    assert_difference 'Label.count', -1 do
      project.labels.first.destroy  
    end
  end

  test "should respond_to with_todos" do
    assert_respond_to Project, :with_todos
  end

  test "should return projects with_todos only" do
    first_project = create(:project)
    second_project = create(:project_with_todos)

    assert_includes Project.with_todos, second_project
    assert_not_includes Project.with_todos, first_project
  end
end
