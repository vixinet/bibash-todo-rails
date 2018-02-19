require 'test_helper'

class LabelTest < ActiveSupport::TestCase
  test "should be valid" do
    label = build(:label)
    assert label.valid?
  end

  test "should require label" do
    label = build(:label, label: nil)
    refute label.valid?
  end

  test "should require color" do
    label = build(:label, color: nil)
    refute label.valid?
  end

  test "should require color with #" do
    label = build(:label, color: 'FF0000')
    refute label.valid?
  end

  test "should require color with 3 chars" do
    label = build(:label, color: '#FFF')
    assert label.valid?
  end

  test "should reject color with 4 chars" do
    label = build(:label, color: '#FFFF')
    refute label.valid?
  end

  test "should require color with 6 chars" do
    label = build(:label, color: '#FF0000')
    assert label.valid?
  end

  test "should have many projects" do
    label = create(:label_with_projects)
    assert_equal 5, label.projects.size
  end

  test "should not be destroyed when label is destroyed" do
    label = create(:label_with_projects)

    assert_no_difference 'Label.count' do
      label.projects.first.destroy
    end

    assert_difference 'Project.count', -1 do
      label.projects.first.destroy
    end
  end

  # test github
  # test github bis
end
