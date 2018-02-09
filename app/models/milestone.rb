class Milestone < ApplicationRecord
  validates :label, presence: true
  validates :deadline, presence: true
  
  belongs_to :project

  def active?
    if project.status == "open"
      true
    else 
      false
    end
  end

  def active_second?
    # This method is the same than active? in its behaviour 
    project.status == "open"
  end

  def active_third?
    # This method is the same than active? in its behaviour 
    project.open?
  end
end
