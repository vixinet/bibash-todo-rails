require 'test_helper'

class MilestoneTest < ActiveSupport::TestCase
  test "should be valid" do
    milestone = build(:milestone)
    assert milestone.valid?
  end

  test "should require label" do
    milestone = build(:milestone, label: nil)
    refute milestone.valid?
  end

  test "should require deadline" do
    milestone = build(:milestone, deadline: nil)
    refute milestone.valid?
  end

  test "should require project" do
    milestone = build(:milestone, project: nil)
    refute milestone.valid?
  end

  test "should have deadline as a date" do
    milestone = build(:milestone, deadline: DateTime.now)
    assert_kind_of ActiveSupport::TimeWithZone, milestone.deadline
  end

  test "should respond to active?" do
    milestone = build(:milestone)
    assert_respond_to milestone, :active?
  end

  test "should have active? true when project open" do
    project = build(:project, status: :open)
    milestone = build(:milestone, project: project)
    assert milestone.active?
  end

  test "should have active? false when project close" do
    project = build(:project, status: :close)
    milestone = build(:milestone, project: project)
    refute milestone.active?
  end

  test "should be destroyable" do
    milestone = create(:milestone)
    assert_difference 'Milestone.count', -1 do 
      milestone.destroy
    end
  end

  test "should be destroyed when project is destroyed" do
    milestone = create(:milestone)
    assert_difference 'Milestone.count', -1 do 
      milestone.project.destroy
    end
  end
end
