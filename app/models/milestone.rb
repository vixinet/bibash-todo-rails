class Milestone < ApplicationRecord
  validates :label, presence: true
  validates :deadline, presence: true
  
  belongs_to :project
end
